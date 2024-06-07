return {
  'williamboman/mason-lspconfig.nvim',
  config = function()
    require('mason-lspconfig').setup({
			ensure_installed = { "clangd", "pyright", "bashls", "lua_ls", "vimls"},
    })
    -- 此处可以进一步配置 mason-lspconfig 自动配置的 LSP，如添加钩子或特定修改
  end
}

