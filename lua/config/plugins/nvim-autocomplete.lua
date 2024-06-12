return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-path", -- 编辑时自动补全文件系统路径
		"hrsh7th/cmp-buffer", -- 提供当前缓冲区（已打开文件）中文件的自动补全
		"hrsh7th/cmp-nvim-lsp", -- 提供与LSP服务集成的自动补全功能。提供代码理解，错误检查，自动补全等功能
		"hrsh7th/cmp-cmdline", -- 提供命令行模式下的自动补全功能
  	"L3MON4D3/LuaSnip", -- LuaSnip 插件，用于代码片段
  	"saadparwaiz1/cmp_luasnip", -- 集成LuaSnip到nvim-cmp
	},
  config = function()
		local cmp = require('cmp')
		local luasnip = require("luasnip")
    cmp.setup {
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				['<C-j>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, {'i', 's'}),
				['<C-k'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, {'i', 's'}),
				['<C-Space>'] = cmp.mapping.complete(), -- 开启补全
				['<C-e>'] = cmp.mapping.abort(), -- 关闭补全
				['<CR>'] = cmp.mapping.confirm({ select = true }), -- 选择当前项
			}),
			sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- 添加片段源
        { name = 'buffer', keyword_length = 2 },
        { name = 'path' },
      }),
		}
	end
}

