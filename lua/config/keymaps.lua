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
	-- tab
	{ from = "<leader>n",          to = ":tabp<CR>", },
	{ from = "<leader>m",          to = ":tabn<CR>", },
	{ from = "<leader>b",          to = ":tabo<CR>", },
	{ from = "<leader>v",          to = ":tabc<CR>", },
	-- nvim-tree
	{ from = "<c-n>",         to = ":NvimTreeToggle<CR>", },
	-- copy all
	{ from = "<c-b>",         to = "ggVG\"+yG", },
	-- Navigate errors in code
	{ from = "<leader>j",         to = ":lua vim.diagnostic.goto_next()<CR>", },
	{ from = "<leader>k",         to = ":lua vim.diagnostic.goto_prev()<CR>", },
	
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

-- 编译运行cpp文件
local function compile_and_run_cpp()
  -- 1. 保存当前文件
  vim.cmd('w')

  -- 2. 获取文件名，vim.fn.shellescape 是 Lua 中调用 shellescape 的方式
  local source_file = vim.fn.shellescape(vim.fn.expand('%'))
  local output_file = vim.fn.shellescape(vim.fn.expand('%<'))

  -- 3. 构建命令字符串
  local cmd = string.format('g++-14 -std=c++20 -Wall %s -o %s && time ./%s', source_file, output_file, output_file)

  -- 4. 在新的垂直分屏中打开终端并执行
  vim.cmd('vsplit')
  vim.cmd('terminal ' .. cmd)
end

-- 绑定到 F9
vim.keymap.set('n', '<F9>', compile_and_run_cpp, {
  noremap = true,
  silent = true,
  desc = "Compile and run C++ file"
})

