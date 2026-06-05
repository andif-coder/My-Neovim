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
    
    -- 1. 配置你的全局知识库物理路径
    workspaces = {
      {
        name = "cwj",
        path = "~/Workspace/MyVault", -- 替换为你本地 Vault 的绝对路径
      },
    },

    -- 2. 指定你的附件集散地（对应你的 900 Assets）
    attachments = {
      folder = "900_Assets",
    },

    -- 3. 配置内置 Picker（推荐使用 telescope、fzf-lua 或 snacks.picker）
    picker = {
      name = "snacks.picker",
    },
  },
}
