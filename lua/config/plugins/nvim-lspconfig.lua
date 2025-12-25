return {
  -- LSP 基础配置插件
  'neovim/nvim-lspconfig',
  -- 确保在 nvim-mason-lspconfig 之后加载
  -- 这样可以确保 Mason 安装的 server 路径已经被正确添加到环境变量中
  after = 'nvim-mason-lspconfig',
  config = function()
    -----------------------------------------------------------
    -- 1. 定义按键绑定函数 (on_attach)
    -----------------------------------------------------------
    -- 这个函数会在 LSP 成功连接到当前 buffer 后执行
    -- 虽然 Neovim 0.11 推荐用 LspAttach 事件，但这种老写法依然有效且兼容
    local on_attach = function(client, bufnr)
      -- 给当前 buffer 设置按键映射：普通模式下按 'gd' 跳转到定义
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true })
    end
    -----------------------------------------------------------
    -- 2. 定义补全能力 (capabilities)
    -----------------------------------------------------------
    -- Neovim 默认不包含补全插件需要的某些特性 (如 snippets)
    -- 这里从 cmp_nvim_lsp 获取默认能力，告诉 LSP Server 我们支持补全
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    -----------------------------------------------------------
    -- 3. 配置 Clangd (C/C++) - 最复杂的配置
    -----------------------------------------------------------
    -- 使用新版 API: 先把配置表赋值给 vim.lsp.config.clangd
    vim.lsp.config.clangd = {
        -- 初始化选项
        init_options = {
            -- 如果找不到 compile_commands.json，默认使用 C++20 标准
            fallbackFlags = {'--std=c++20'}
        },
        -- 自定义启动命令和参数
        cmd = {
            "clangd",
            -- 允许 clangd 调用外部驱动程序 (这里指定了 homebrew 安装的 gcc-13)
            -- 这对于在该环境下正确解析标准库头文件非常重要
            "--query-driver=/usr/bin/g++",
            -- 自动插入头文件 (IWYU 风格)
            "--header-insertion=iwyu",
            -- 后台建立索引，加快跳转速度
            "--background-index",
            -- 开启 clang-tidy 静态检查
            "--clang-tidy",
            -- 补全函数时显示参数占位符
            "--function-arg-placeholders",
            -- 如果没有格式化配置，回退到 LLVM 风格
            "--fallback-style=llvm",
            -- 开启全作用域补全
            "--all-scopes-completion",
            -- 提供详细的补全信息
            "--completion-style=detailed",
        },
        -- 注入之前定义的按键绑定
        on_attach = on_attach,
        -- 注入补全能力
        capabilities = capabilities
    }
    -- 【关键步骤】手动启用 clangd 服务
    vim.lsp.enable("clangd") 
    -----------------------------------------------------------
    -- 4. 配置其他语言 Server
    -----------------------------------------------------------
    -- (1) Python (Pyright)
    vim.lsp.config.pyright = { on_attach = on_attach, capabilities = capabilities }
    vim.lsp.enable("pyright")
    -- (2) Bash (Bash Language Server)
    vim.lsp.config.bashls = { on_attach = on_attach, capabilities = capabilities }
    vim.lsp.enable("bashls")
    -- (3) Lua (Lua Language Server)
    vim.lsp.config.lua_ls = { on_attach = on_attach, capabilities = capabilities }
    vim.lsp.enable("lua_ls")
    -- (4) VimScript (Vim Language Server)
    vim.lsp.config.vimls = { on_attach = on_attach, capabilities = capabilities }
    vim.lsp.enable("vimls")
  end
}
