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

-- Move position buffer
keymap("n", "<M-left>", ":BufferLineMovePrev<cr>", opts)
keymap("n", "<M-right>", ":BufferLineMoveNext<cr>", opts)

-- New tab
keymap("n", "<tab>", ":tabnext<Return>", opts)
keymap("n", "te", ":tabedit")
keymap("n", "<s-tab>", ":tabprev<Return>", opts)

-- Split window
keymap("n", "ss", ":split<Return>", opts)
keymap("n", "sv", ":vsplit<Return>", opts)

keymap("n", "gR", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { desc = "Rename with word under cursor", expr = true })
