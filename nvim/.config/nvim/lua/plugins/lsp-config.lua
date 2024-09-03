local util = require("lspconfig.util")

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
          root_dir = function(fname)
            return util.root_pattern("src/app.vue")(fname) or util.root_pattern("vite.config.ts")(fname)
          end,
        },
      },
    },
  },
}
