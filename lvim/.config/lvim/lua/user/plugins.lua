lvim.plugins = {
-- {"folke/tokyonight.nvim"},
-- {
--   "folke/trouble.nvim",
--   cmd = "TroubleToggle",
-- },
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("user.hop").config()
    end,
  },
  {
    "karb94/neoscroll.nvim" ,
    config = function()
      require("user.neoscroll").config()
    end,
  }
  -- {
  --   "kdheepak/lazygit.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("user.lazygit").config()
  --   end,
  -- }
}
