-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- local discipline = require("craftzdog.discipline")
--
-- discipline.cowboy()

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

------- ADD custom LazyVim keymaps -------

-- Better comment
local commentOpts = { desc = "Comment line", remap = true }
keymap("n", "<leader>/", "gcc", commentOpts)
keymap("v", "<leader>/", "gc", commentOpts)

-- Increment/decrement
keymap("n", "+", "<C-a>")
keymap("n", "-", "<C-x>")

-- Select all
keymap("n", "<C-a>", "gg<S-v>G", opts)

-- Better escape - combine escape and no highliting
keymap({ "n", "v", "i" }, "<C-c>", "<Esc>:noh<return><Esc>", opts)

-- Better move with TMUX
keymap({ "n", "v", "i" }, "<C-h>", "<cmd>TmuxNavigateLeft<cr>", opts)
keymap({ "n", "v", "i" }, "<C-l>", "<cmd>TmuxNavigateRight<cr>", opts)
keymap({ "n", "v", "i" }, "<C-j>", "<cmd>TmuxNavigateDown<cr>", opts)
keymap({ "n", "v", "i" }, "<C-k>", "<cmd>TmuxNavigateUp<cr>", opts)

-- Tabs motion
keymap("n", "<M-left>", ":tabprev<Return>", opts)
keymap("n", "<M-right>", ":tabnext<Return>", opts)
keymap("n", "td", ":tabc<Return>", opts)

-- Split window
keymap("n", "ss", ":split<Return>", opts)
keymap("n", "sv", ":vsplit<Return>", opts)

-- Better move in insert mode
keymap("i", "<C-Return>", "<Esc>o", opts)
keymap("i", "<C-S-Return>", "<Esc>O", opts)

-- Better rename
keymap("n", "gR", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { desc = "Rename with word under cursor", expr = true })
