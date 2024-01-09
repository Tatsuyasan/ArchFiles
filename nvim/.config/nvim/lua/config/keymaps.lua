-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- local discipline = require("craftzdog.discipline")
--
-- discipline.cowboy()
local wk = require("which-key")

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

keymap("n", "<M-h>", "_", opts)
keymap("n", "<M-l>", "$", opts)

keymap("n", "<M-S-h>", ":BufferLineMovePrev<cr>", opts)
keymap("n", "<M-S-l>", ":BufferLineMoveNext<cr>", opts)

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

wk.register({
  t = {
    name = "telescope",
    y = { "<cmd>Telescope yank_history<cr>", "Telescope yank history" },
    e = { "<cmd>Telescope emoji<cr>", "Telescope emoji" },
    b = { "<cmd>Telescope buffers<cr>", "Telescope buffers" },
    q = { "<cmd>Telescope quickfix<cr>", "Telescope quickfix" },
    s = { "<cmd>Telescope live_grep<cr>", "Telescope live grep" },
    h = { "<cmd>Telescope man_pages<cr>", "Telescope man pages" },
    n = { "<cmd>Telescope notify<cr>", "Telescope notify" },
    u = { "<cmd>Telescope undo<cr>", "Telescope undo" },
  },
}, { prefix = "<leader>" })

-- Better rename
keymap("n", "gR", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { desc = "Rename with word under cursor", expr = true })
