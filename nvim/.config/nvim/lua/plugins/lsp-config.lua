return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      eslint = {
        settings = {
          rulesCustomizations = {
            -- Disable some rules that conflight with tsserver warnings
            { rule = "*no-unused-vars", severity = "off" },
          },
        },
      },
    },
  },
}
