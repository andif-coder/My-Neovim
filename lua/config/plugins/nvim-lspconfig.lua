return {
  'neovim/nvim-lspconfig',
  after = 'nvim-mason-lspconfig',  -- 确保在 mason-lspconfig 之后加载
  config = function()
    local lspconfig = require('lspconfig')
    -- 定义通用的 on_attach 函数
    local on_attach = function(client, bufnr)
      -- 你可以在这里定义键位绑定，例如:
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true })
    end

    -- 定义 capabilities
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- 配置每个必要的 LSP server
    lspconfig.clangd.setup({
			init_options = {
				fallbackFlags = {'--std=c++20'}
			},
			cmd = {
				"clangd",
				"--query-driver=/opt/homebrew/Cellar/gcc/13.2.0/bin/g++-13",
				"--fallback-style=llvm",
				"--header-insertion=iwyu",
			},
			on_attach = on_attach,
			capabilities = capabilities
		})
    lspconfig.pyright.setup({ on_attach = on_attach, capabilities = capabilities })
    lspconfig.bashls.setup({ on_attach = on_attach, capabilities = capabilities })
    lspconfig.lua_ls.setup({ on_attach = on_attach, capabilities = capabilities })
    lspconfig.vimls.setup({ on_attach = on_attach, capabilities = capabilities })
  end
}

