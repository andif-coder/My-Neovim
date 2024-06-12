return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-path", -- 编辑时自动补全文件系统路径
		"hrsh7th/cmp-buffer", -- 提供当前缓冲区（已打开文件）中文件的自动补全
		"hrsh7th/cmp-nvim-lsp", -- 提供与LSP服务集成的自动补全功能。提供代码理解，错误检查，自动补全等功能
		"hrsh7th/cmp-cmdline", -- 提供命令行模式下的自动补全功能
  	"L3MON4D3/LuaSnip", -- LuaSnip 插件，用于代码片段
  	"saadparwaiz1/cmp_luasnip", -- 集成LuaSnip到nvim-cm
	},
  config = function()
		local cmp = require('cmp')
    cmp.setup {
			mapping = cmp.mapping.preset.insert({
				['<C-j>'] = cmp.mapping.select_next_item(), -- 下一项
				['<C-k>'] = cmp.mapping.select_prev_item(), -- 上一项
				['<C-Space>'] = cmp.mapping.complete(), -- 开启补全
				['<C-e>'] = cmp.mapping.abort(), -- 关闭补全
				['<CR>'] = cmp.mapping.confirm({ select = true }), -- 选择当前项
			}),
			sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- 添加片段源
        { name = 'buffer' },
        { name = 'path' }
      }),
		}
	end
}

