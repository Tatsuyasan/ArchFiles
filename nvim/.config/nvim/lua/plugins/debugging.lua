local dap = require("dap")

dap.adapters["pwa-chrome"] = {
  type = "executable",
  command = "node",
  args = { os.getenv("HOME") .. "/vscode-chrome-debug/out/src/chromeDebug.js" },
}

local languages = {
  "typescript",
  "javascript",
  "javascriptreact",
  "typescriptreact",
  "vue",
}

for _, language in ipairs(languages) do
  dap.configurations[language] = {
    -- Launch back project & Debug.
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch Project",
      runtimeArgs = function()
        local co = coroutine.running()
        return coroutine.create(function()
          vim.ui.input({ prompt = "Enter command to start project: ", default = "run start:debug" }, function(command)
            if command == nil or command == "" then
              return
            else
              -- Fonction pour splitter la chaîne de caractères par des espaces
              local args = {}
              for word in string.gmatch(command, "%S+") do
                table.insert(args, word)
              end

              -- Reprendre la coroutine en passant le tableau d'arguments
              coroutine.resume(co, args)
            end
          end)
        end)
      end,

      runtimeExecutable = function()
        local co = coroutine.running()
        return coroutine.create(function()
          vim.ui.input({ prompt = "Enter executable: ", default = "npm" }, function(url)
            if url == nil or url == "" then
              return
            else
              coroutine.resume(co, url)
            end
          end)
        end)
      end,
      port = 9229,
      -- skipFiles= ["<node_internals>/**"],
      skipFiles = { "**/node_modules/**/*", "**/@vite/*", "**/src/client/*", "**/src/*" },
      sourceMaps = true,
      cwd = "${workspaceFolder}",
      console = "integratedTerminal",
    },
    -- Debug web applications (client side)
    {
      type = "pwa-chrome",
      name = "Launch Chromium & Debug Web App",
      request = "launch",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = "inspector",
      port = 9222,
      url = function()
        local co = coroutine.running()
        return coroutine.create(function()
          vim.ui.input({ prompt = "Enter URL: ", default = "http://localhost:8080" }, function(url)
            if url == nil or url == "" then
              return
            else
              coroutine.resume(co, url)
            end
          end)
        end)
      end,
      webRoot = "${workspaceFolder}/src",
      runtimeExecutable = "/usr/bin/chromium-browser", -- Chemin vers Chromium
      -- runtimeExecutable = "/usr/bin/google-chrome-stable", -- Chemin vers Chromium
      runtimeArgs = { "--new-window", "--remote-debugging-port=9222" }, -- Arguments pour lancer une nouvelle instance
      skipFiles = { "**/node_modules/**/*", "**/@vite/*", "**/src/client/*", "**/src/*" },
    },
    -- {
    --   type = "pwa-node",
    --   request = "attach",
    --   name = "Attach to Project",
    --   port = 9229,
    --   skipFiles = { "**/node_modules/**/*" },
    --   sourceMaps = true,
    --   cwd = "${workspaceFolder}",
    -- },
    -- Debug nodejs processes (make sure to add --inspect when you run the process)
    -- {
    --   type = "pwa-node",
    --   request = "attach",
    --   name = "Pick process & Attach",
    --   processId = require("dap.utils").pick_process,
    --   cwd = "${workspaceFolder}",
    --   sourceMaps = true,
    -- },
    -- Debug single nodejs files
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
      sourceMaps = true,
    },
    -- Divider for the launch.json derived configs
    -- {
    --   name = "------ ↓ launch.json configs ↓ ------",
    --   type = "",
    --   request = "launch",
    -- },
  }
end

return {}
