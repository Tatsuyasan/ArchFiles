return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    default_component_configs = {
      git_status = {
        symbols = {
          -- Here to change symbols
          -- added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
          -- modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
          -- deleted = "✖", -- this can only be used in the git_status source
          -- renamed = "󰁕", -- this can only be used in the git_status source
          -- -- Status type
          -- untracked = "",
          -- ignored = "",
          -- unstaged = "󰄱",
          -- staged = "",
          -- conflict = "",
        },
      },
    },
    window = {
      filesystem = {
        filtered_items = {
          always_show = {
            ".gitignore",
            ".env",
            ".env.local",
          },
        },
      },
    },
  },
}
