return {
  -- 其他插件
  {
    "smoka7/hop.nvim",
    keys = {
      { "<leader>w", "<cmd>HopWord<CR>", desc = "Hop to Word" },
      { "<leader>l", "<cmd>HopLine<CR>", desc = "Hop to Line" },
      { "<leader>c", "<cmd>HopChar1<CR>", desc = "Hop to Char one" },
    },
    config = function()
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }
}

