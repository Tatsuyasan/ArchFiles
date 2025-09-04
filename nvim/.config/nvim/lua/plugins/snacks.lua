return {
  "folke/snacks.nvim",
  opts = {
    files = { hidden = true, ignored = true },
    explorer = { hidden = true, ignored = true },
    picker = { hidden = true, ignored = true, exclude = { "node_modules", "dist", "coverage" } },
    grep = { hidden = true, ignored = true, exclude = { "node_modules", "dist", "coverage" } },
    grep_word = { hidden = true, ignored = true, exclude = { "node_modules", "dist", "coverage" } },
    grep_buffers = { hidden = true, ignored = true },
    terminal = {
      win = {
        position = "float",
        border = "rounded",
        backdrop = 60,
        height = 0.9,
        width = 0.9,
        zindex = 50,
      },
    },
  },
  keys = {
    {
      "<leader>fe",
      LazyVim.pick("explorer"),
      desc = "Explorer Snacks (cwd)",
    },
    {
      "<leader>fE",
      LazyVim.pick("explorer", { cwd = LazyVim.root() }),
      desc = "Explorer Snacks (Root dir)",
    },
    { "<leader>e", "<leader>fE", desc = "Explorer Snacks (root dir)", remap = true },
    { "<leader>E", "<leader>fe", desc = "Explorer Snacks (cwd)", remap = true },
    { "<leader>sg", LazyVim.pick("live_grep", { root = false }), desc = "Grep (cwd)" },
    { "<leader>sG", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
    {
      "<leader><space>",
      LazyVim.pick("smart", { exclude = { "node_modules", "dist", "coverage" }, cwd = LazyVim.root() }),
      desc = "Find Files smart (Root Dir)",
    },
    {
      "<C-/>",
      function()
        Snacks.terminal.toggle()
      end,
      desc = "Open Terminal",
      remap = true,
    },
  },
}
