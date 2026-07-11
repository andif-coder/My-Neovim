# My-Neovim
## 安装指南
1. 如果没有~/.config文件，则建立一个~/.config文件
2. cd ~/.config
3. git clone git@github.com:andif-coder/My-Neovim.git nvim
## nvim自带快捷键
`[d`: 跳转到上一个编译报错的地方
`]d`: 跳转到下一个编译报错的地方
# 插件
## 插件检查
随便用neovim打开一个文件，然后:checkhealth xxx，其中xxx是你要检查的插件名字
## hop
用于跳转，主要的功能:
1. 跳转到单词，对应的快捷键: "\<leader\>w"
2. 跳转到行，对应的快捷键: "\<leader\>l"
3. 跳转到一个字母，对应的快捷键: "\<leader\>c"
## markdown preview
用来预览.md文件，主要的功能：
1. 通过浏览器预览当前的md文件: ":MarkdownPreview"
## Obsidian
### 前置条件
需要安装rg，可以通过`brew install ripgrep`
### 操作
obsidian笔记插件
1. 搜索匹配某些文本的笔记，对应快捷键:":Obsidian search"
## git插件
主要有两个插件：
1. gitsigns主要用来快速看到改动
2. lazygit用来提交代码
### 前置条件
需要安装了lazygit，可以通过`brew install lazygit`
### gitsigns操作
1. 跳到上一个修改块, 对应快捷键:"<leader>g-"
2. 跳到下一个修改块, 对应快捷键:"<leader>g="
3. 查看当前代码块的修改，对应快捷键："H"
4. 查看当前行的历史，对应快捷键:"<leader>gb"
5. 回退当前代码块的修改（回退到前一次commit的版本）, 对应快捷键:"<leader>gr"
### lazygit操作
1. 唤起lazygit，对应快捷键:"ctrl + g"
2. 退出lazygit，对应快捷键:"q"
3. 暂存/取消暂存某个地方的修改，如果你放在某一行代码就影响这行代码，如果你放在某个文件夹，那么就是这个文件夹下面所有的修改，类似`git add`， 对应快捷键:"空格“
4. 提交已经添加的修改, 类似`git commit -m`, 对应快捷键:"c"
5. 推送到远程，类似`git push origin main`, 对应快捷键:"P"
