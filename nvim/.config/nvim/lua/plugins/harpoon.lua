return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = true,
  keys = {
    {
      "<leader>m",
      "<cmd>lua require('harpoon.mark').add_file()<cr><cmd>lua require('notify')('📌 file marked')<cr>",
      desc = "Mark file with harpoon",
    },
    { "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "Go to next harpoon mark" },
    { "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = "Go to previous harpoon mark" },
    { "<leader>a", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Show harpoon marks" },
  },
}
-- return {

--   "ThePrimeagen/harpoon",
--   dependencies = { "nvim-lua/plenary.nvim" },
--   keys = {
--     {
--       "<leader>A",
--       function()
--         require("harpoon"):list():append()
--       end,
--       desc = "harpoon file",
--     },
--     {
--       "<leader>a",
--       function()
--         local harpoon = require("harpoon")
--         harpoon.ui:toggle_quick_menu(harpoon:list())
--       end,
--       desc = "harpoon quick menu",
--     },
--     {
--       "<leader>1",
--       function()
--         require("harpoon"):list():select(1)
--       end,
--       desc = "harpoon to file 1",
--     },
--     {
--       "<leader>2",
--       function()
--         require("harpoon"):list():select(2)
--       end,
--       desc = "harpoon to file 2",
--     },
--     {
--       "<leader>3",
--       function()
--         require("harpoon"):list():select(3)
--       end,
--       desc = "harpoon to file 3",
--     },
--     {
--       "<leader>4",
--       function()
--         require("harpoon"):list():select(4)
--       end,
--       desc = "harpoon to file 4",
--     },
--     {
--       "<leader>5",
--       function()
--         require("harpoon"):list():select(5)
--       end,
--       desc = "harpoon to file 5",
--     },
--   },
--   config = function()
--     require("harpoon"):setup()
--   end,
-- }
