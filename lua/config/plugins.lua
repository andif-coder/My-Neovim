local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- 高亮匹配文档，并快速跳转
  require("config.plugins.flash"),
  -- easymotion，快速跳转（跳转到单元，行，字母等）
  require("config.plugins.hop"),
  -- 语法树
  require("config.plugins.nvim-treesitter"),
  -- 主题
  require("config.plugins.onedark"),
  -- 图标
  require("config.plugins.nvim-web-devicons"),
  -- 目录树
  require("config.plugins.nvim-tree"),
	-- mason
  require("config.plugins.nvim-mason"),
  require("config.plugins.nvim-mason-lspconfig"),
  require("config.plugins.nvim-lspconfig"),
	-- git
	require("config.plugins.nvim-git"),
	-- 状态栏
	require("config.plugins.nvim-statusline"),
	-- 代码补全
  require("config.plugins.nvim-autocomplete"),
}, {})

