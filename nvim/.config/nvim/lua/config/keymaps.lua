-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local wk = require("which-key")
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Better comment
local commentOpts = { desc = "Comment line", remap = true }
keymap("n", "<leader>/", "gcc", commentOpts)
keymap("v", "<leader>/", "gc", commentOpts)

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

-- Better move in insert mode
keymap("i", "<C-Return>", "<Esc>o", opts)
keymap("i", "<C-S-Return>", "<Esc>O", opts)

wk.add({
  { "<leader>D", "<cmd>LazyDocker<CR>", desc = "Toggle LazyDocker" },
  { "<leader>T", group = "telescope" },
  { "<leader>Tb", "<cmd>Telescope buffers<cr>", desc = "Telescope buffers" },
  { "<leader>Te", "<cmd>Telescope emoji<cr>", desc = "Telescope emoji" },
  { "<leader>Th", "<cmd>Telescope man_pages<cr>", desc = "Telescope man pages" },
  { "<leader>Tn", "<cmd>Telescope notify<cr>", desc = "Telescope notify" },
  { "<leader>Tq", "<cmd>Telescope quickfix<cr>", desc = "Telescope quickfix" },
  { "<leader>Tr", "<cmd>Telescope resume<cr>", desc = "Telescope resume" },
  { "<leader>Ts", "<cmd>Telescope live_grep<cr>", desc = "Telescope live grep" },
  { "<leader>Tt", group = "tmux" },
  { "<leader>Ttp", "<cmd>Telescope tmux pane_contents<cr>", desc = "Telescope tmux pane_contents" },
  { "<leader>Tts", "<cmd>Telescope tmux sessions<cr>", desc = "Telescope tmux sessions" },
  { "<leader>Ttw", "<cmd>Telescope tmux windows<cr>", desc = "Telescope tmux windows" },
  { "<leader>Tu", "<cmd>Telescope undo<cr>", desc = "Telescope undo" },
  { "<leader>Ty", "<cmd>Telescope yank_history<cr>", desc = "Telescope yank history" },
  { "<leader>bh", "<cmd>:BufferLineCloseLeft<cr>", desc = "Delete buffers to the left" },
  { "<leader>bl", "<cmd>:BufferLineCloseRight<cr>", desc = "Delete buffers to the right" },
  { "<leader>cL", "<cmd>LspRestart<cr>", desc = "lsp restart" },
  { "<leader>cc", group = "Copilot Chat" },
  { "<leader>gb", "<cmd>ToggleBlame virtual<cr>", desc = "Git blame on file" },
  { "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Git preview hunk" },
  { "<leader>gt", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Git blame virtual text toggle" },
})
