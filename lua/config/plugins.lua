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
    -- easymotion
    require("config.plugins.flash"),
    -- 语法树
    require("config.plugins.nvim-treesitter"),
    -- 主题
    require("config.plugins.onedark"),
    -- 图标
    require("config.plugins.nvim-web-devicons"),
    -- 目录树
    require("config.plugins.nvim-tree"),
    -- require("config.plugins.nvim-web-devicons")
}, {})

