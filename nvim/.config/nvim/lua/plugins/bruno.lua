return {
  "romek-codes/bruno.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "folke/snacks.nvim",
      opts = { picker = { enabled = true } },
    },
  },
  config = function()
    require("bruno").setup({
      -- Paths to your bruno collections.
      collection_paths = {
        -- { name = "Main", path = "/path/to/folder/containing/collections/Documents/Bruno" },
        {
          name = "Check-ethics",
          path = "/home/20104519/projects/adeo/check-ethics/hf3p--ba-check-ethics/apps/back/bruno",
        },
      },
      picker = "snacks",
      -- If output should be formatted by default.
      show_formatted_output = true,
      -- If formatting fails for whatever reason, don't show error message (will always fallback to unformatted output).
      suppress_formatting_errors = true,
    })
  end,
}
