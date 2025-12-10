-- local cmp_window = require("cmp.config.window")
--
-- return {
--   "hrsh7th/nvim-cmp",
--   dependencies = {
--     "hrsh7th/cmp-emoji",
--   },
--   opts = {
--     window = {
--       completion = cmp_window.bordered(),
--       documentation = cmp_window.bordered(),
--     },
--   },
-- }
--
return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      accept = {
        -- experimental auto-brackets support
        auto_brackets = {
          enabled = true,
        },
      },
      menu = { border = "rounded" },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = { border = "rounded" },
      },
      ghost_text = {
        enabled = vim.g.ai_cmp,
      },
    },
  },
}
