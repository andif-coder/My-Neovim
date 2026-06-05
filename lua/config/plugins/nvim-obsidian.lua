return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- 强烈推荐：使用最新的稳定 Release 版本，而不是 main 分支
  lazy = true,
  ft = "markdown", -- 仅在打开 markdown 文件时延迟加载
  dependencies = {
    "nvim-lua/plenary.nvim", -- 必要依赖，类似obsidian的地基
		"folke/snacks.nvim",     -- 高颜值选择器
    "hrsh7th/nvim-cmp",      -- 核心补全引擎
  },
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false, -- 禁用老旧命令，对齐未来的 4.0.0 版本
    -- 配置你的全局知识库物理路径
    workspaces = {
      {
        name = "cwj",
        path = "~/Workspace/MyVault", -- 替换为你本地 Vault 的绝对路径
      },
    },
    -- 指定你的附件集散地（对应你的 900 Assets）
    attachments = {
      folder = "900_Assets",
    },
    -- 配置内置 Picker（推荐使用 telescope、fzf-lua 或 snacks.picker）
    picker = {
      name = "snacks.picker",
    },
		-- 设置新笔记的默认路径
		notes_subdir = "000_Inbox",
		new_notes_location = "notes_subdir",
		-- 彻底干掉随机长数字（Zettelkasten ID），让文件名 100% 等于你的标题
    note_id_func = function(title)
      if title ~= nil then
        -- 如果你输入了标题，就直接用标题作为物理文件名
        -- 顺手把标题里的空格替换成短横线（对终端文件更友好），并且完美支持中文文件名
        return title:gsub(" ", "-")
      else
        -- 如果你直接敲了 :ObsidianNew 却没给标题，才用时间戳数字兜底，防止报错
        return "Untitled-" .. tostring(os.time())
      end
    end,
  },
}
