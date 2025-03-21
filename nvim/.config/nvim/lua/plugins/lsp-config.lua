local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

lspconfig.eslint.setup({
  settings = {
    workingDirectory = { mode = "location" },
  },
  root_dir = util.find_git_ancestor,
})

vim.lsp.inlay_hint.enable(false)

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        volar = {
          filetypes = {
            "typescript",
            "javascript",
            "javascriptreact",
            "typescriptreact",
            "vue",
            "json",
          },
          root_dir = util.root_pattern(".git"),
          -- function(fname)
          --   return util.root_pattern("pnpm-workspace.yaml")(fname)
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
        },
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
