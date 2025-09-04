return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  opts = {},
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "DiffView" },
    { "<leader>gr", "<cmd>DiffviewFileHistory<cr>", desc = "DiffView repo history" },
    { "<leader>g%", "<cmd>DiffviewFileHistory --follow %<cr>", desc = "DiffView file history" },
    {
      mode = { "v" },
      "<leader>ghd",
      "<Esc><Cmd>'<,'>DiffviewFileHistory --follow<CR>",
      desc = "DiffView range history",
    },
    {
      "<leader>gj",
      "<Cmd>.DiffviewFileHistory --follow<CR>",
      desc = "DiffView line history",
    },
  },
}
