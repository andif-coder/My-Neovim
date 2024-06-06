-- config/plugins/treesitter.lua
return {
  "nvim-treesitter/nvim-treesitter", -- 插件标识
  event = "BufRead", -- 触发插件加载的事件
  run = ":TSUpdate", -- 安装后执行更新
  config = function()  -- Treesitter 的配置
    require('nvim-treesitter.configs').setup {
      ensure_installed = {"cpp", "python", "c", "vim"}, -- 或指定语言列表 ["python", "lua", "javascript"]
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
      },
      fold = {
          enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm"
        }
      },
      indent = {
        enable = true
      }
    }
  end
}

