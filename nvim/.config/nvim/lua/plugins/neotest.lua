return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/neotest-jest",
    "marilari88/neotest-vitest",
  },
  opts = {
    -- Can be a list of adapters like what neotest expects,
    -- or a list of adapter names,
    -- or a table of adapter names, mapped to adapter configs.
    -- The adapter will then be automatically loaded with the config.
    adapters = {
      ["neotest-jest"] = {
        -- jestCommand = "",
        -- jestConfigFile = "jest.config.ts",
        env = { CI = true },
        cwd = function(path)
          return vim.fn.getcwd()
        end,
      },
      ["neotest-vitest"] = {
        env = { CI = true },
        filter_dir = function(name, rel_path, root)
          -- Only include directories named "tests" inside "apps/*"
          if rel_path:match("^apps/.+/tests$") then
            return true
          end
          -- Always exclude node_modules
          return name ~= "node_modules"
        end,
      },
    },
    -- Example for loading neotest-go with a custom config
    -- adapters = {
    --   ["neotest-go"] = {
    --     args = { "-tags=integration" },
    --   },
    -- },
    status = { virtual_text = true },
    output = { open_on_run = true },
    quickfix = {
      open = function()
        if LazyVim.has("trouble.nvim") then
          require("trouble").open({ mode = "quickfix", focus = false })
        else
          vim.cmd("copen")
        end
      end,
    },
  },
}
