vim.g.mapleader = " "

local mode_nv = { "n", "v" }
local mode_v = { "v" }
local mode_i = { "i" }
local nmappings = {
	-- useful
	{ from = "Y",             to = "\"+y",                                                                mode = mode_v },
	{ from = "K",             to = "5k",                                                                  mode = mode_nv },
	{ from = "J",             to = "5j",                                                                  mode = mode_nv },

	-- Window & splits
	{ from = "<up>",          to = ":res +5<CR>", },
	{ from = "<down>",        to = ":res -5<CR>", },
	{ from = "<left>",        to = ":vertical resize-5<CR>", },
	{ from = "<right>",       to = ":vertical resize+5<CR>", },

	-- nvim-tree
	{ from = "<c-n>",         to = ":NvimTreeToggle<CR>", },
	
	-- copy all
	{ from = "<c-b>",         to = "ggVG\"+yG", },
}

for _, mapping in ipairs(nmappings) do
	vim.keymap.set(mapping.mode or "n", mapping.from, mapping.to, { noremap = true })
end

-- 需要silent
vim.keymap.set('n', 'z<space>', function()    -- 在普通模式下，利用 z<space> 切换折叠
  if vim.fn.foldclosed(vim.fn.line('.')) < 0 then   -- 判断当前行折叠是否关闭
    vim.cmd('normal zc')                   -- 如果关闭，则折叠当前区域
  else
    vim.cmd('normal zo')                   -- 如果开启，则展开当前区域
  end
end, { noremap = true, silent = true })       -- 映射选项：不使用递归映射和静默执行

