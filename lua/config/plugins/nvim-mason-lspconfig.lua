return {
  'williamboman/mason-lspconfig.nvim',
  config = function()
    require('mason-lspconfig').setup({
			ensure_installed = { "clangd", "pyright", "bashls", "lua_ls", "vimls"},
    })
  end
}

