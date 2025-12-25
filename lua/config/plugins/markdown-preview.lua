return {
	{
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
    ft = { "markdown" },
    -- 核心修改在这里：直接用字符串写 shell 命令，不要用 function
    build = "cd app && npm install", 
    init = function()
        vim.g.mkdp_filetypes = { "markdown" }
    end
	}
}

