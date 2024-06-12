vim.bo.swapfile = false -- 不产生.swp
vim.cmd([[filetype on]]) -- 启用文件类型检测
vim.cmd([[syntax enable]]) -- 开启语法高亮
vim.o.matchtime = 2 -- 在两次按键输入之间的等待确认匹配的最大时间
vim.o.number = true -- 显示行号
vim.o.cursorline = true -- 高亮显示当前行
vim.o.hlsearch = true -- 高亮显示搜索结果
vim.o.incsearch = true -- 输入搜索时实时显示匹配
vim.o.backspace = "indent,eol,start" -- 设置退格键的删除限制
vim.o.smartindent = true -- 启用智能缩进
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.ignorecase = true -- 设置搜索不区分大小写
vim.o.laststatus = 2 -- 总是显示状态栏
vim.o.termguicolors = true -- 使用 't_Co' 的替代 'termguicolors', 确保其为 true, 启用 true color，用于 256 色支持
vim.wo.foldlevel = 1 -- 当前缓冲区设置
vim.wo.foldmethod = 'expr'             -- 设置折叠方法为基于自定义
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()' -- 折叠方法用treesitter
vim.o.foldenable = true                 -- 启用代码折叠

-- makes * and # work on visual mode too.
vim.api.nvim_exec(
  [[
  function! g:VSetSearch(cmdtype)
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
    let @s = temp
  endfunction

  xnoremap * :<C-u>call g:VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
  xnoremap # :<C-u>call g:VSetSearch('?')<CR>?<C-R>=@/<CR><CR>
]],
  false
)
