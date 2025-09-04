local util = require("lspconfig.util")

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      server = {
        eslint = {},
        volar = {
          root_dir = util.root_pattern(".git"),
          -- function(fname)
          -- return util.root_pattern("pnpm-workspace.yaml")(fname)
          --   -- or util.root_pattern("src/app.vue")(fname)
          --   -- or util.root_pattern("vite.config.ts")(fname)
          -- end,
        },
      },
      eslint = {
        settings = {
          rulesCustomizations = {
            -- Disable some rules that conflight with tsserver warnings
            { rule = "*no-unused-vars", severity = "off" },
          },
          workingDirectory = { mode = "auto" },
        },
        -- root_dir = vim.fs.dirname(vim.fs.find(".git", { path = vim.loop.cwd(), upward = true })[1]),
      },
      ts_ls = {
        root_dir = util.root_pattern(".git"),
      },
      tsserver = {
        root_dir = util.root_pattern(".git"),
      },
      vtsls = {
        root_dir = util.root_pattern(".git"),
      },
    },
  },
}
