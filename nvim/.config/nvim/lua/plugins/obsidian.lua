return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = false,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
    "preservim/vim-markdown",
  },
  commands = {
    "ObsidianOpen",
    "ObsidianNew",
    "ObsidianQuickSwitch",
    "ObsidianFollowLink",
    "ObsidianBacklinks",
    "ObsidianToday",
    "ObsidianYesterday",
    "ObsidianTemplate",
    "ObsidianSearch",
    "ObsidianLink",
    "ObsidianLinkNew",
  },
  init = function()
    local wk = require("which-key")
    local obsidian = require("obsidian")
    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local sorters = require("telescope.sorters")
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")

    wk.register({
      ["<leader>o"] = {
        name = "obsidian",
        a = { "<cmd>ObsidianOpen<cr>", "App Obsidian open note" },
        o = {
          function()
            local title = vim.fn.input("Enter note title: ")
            vim.cmd("ObsidianNew " .. title)
          end,
          "Open new note with title",
        },
        t = { "<cmd>ObsidianToday<cr>", "Daily Note" },
        y = { "<cmd>ObsidianYesterday<cr>", "Yesterday's Note" },
        T = { "<cmd>ObsidianTemplate<cr>", "Template" },
        s = { "<cmd>ObsidianSearch<cr>", "Search" },
        l = { "<cmd>ObsidianLink<cr>", "Link to existing note" },
        L = {
          function()
            local title = vim.fn.input("Enter new note title: ")
            vim.cmd("ObsidianLinkNew " .. title)
          end,
          "Link to new note",
        },
        p = { "<cmd>ObsidianPasteImg<cr>", "Paste image" },
        q = { "<cmd>ObsidianQuickSwitch<cr>", "Quick switch" },
        w = {
          function()
            local get_workspace_from_config = function()
              local names = {}
              for _, workspace in ipairs(obsidian.get_client().opts.workspaces) do
                table.insert(names, workspace.name)
              end
              return names
            end

            local obsidian_workspace_pickers = function(opts)
              opts = opts or {}
              pickers
                .new({
                  layout_strategy = "vertical",
                  layout_config = { height = 10, width = 0.3, prompt_position = "top" },
                }, {
                  prompt_title = "Obsidian workspaces",
                  finder = finders.new_table(get_workspace_from_config()),
                  sorter = sorters.get_generic_fuzzy_sorter({}),
                  attach_mappings = function(prompt_bufnr, _)
                    actions.select_default:replace(function()
                      actions.close(prompt_bufnr)
                      local selected_workspace = action_state.get_selected_entry()[1]
                      obsidian.get_client().switch_workspace(obsidian.get_client(), selected_workspace)
                    end)
                    return true
                  end,
                })
                :find()
            end

            obsidian_workspace_pickers()
          end,
          "Choose workspace",
        },
      },
    })
  end,
  opts = {
    workspaces = {
      {
        name = "work",
        path = "~/notes/work",
      },
      {
        name = "personal",
        path = "~/notes/personal",
      },
    },

    completion = { nvim_cmp = true },

    daily_notes = {
      folder = "daily",
      -- Optional, if you want to change the date format for the ID of daily notes.
      date_format = "%d-%m-%Y",
      -- Optional, if you want to change the date format of the default alias of daily notes.
      alias_format = "%d %-B, %Y",

      template = "daily-template.md",
    },

    disable_frontmatter = true,

    -- Optional, for templates (see below).
    templates = {
      subdir = "templates",
      date_format = "%Y-%m-%d-%a",
      time_format = "%H:%M",
    },

    follow_url_func = function(url)
      vim.fn.jobstart({ "open", url })
    end,

    -- Optional, set to true if you use the Obsidian Advanced URI plugin.
    -- https://github.com/Vinzent03/obsidian-advanced-uri
    use_advanced_uri = true,

    -- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
    open_app_foreground = true,
    ui = {
      enable = true, -- set to false to disable all additional syntax features
      update_debounce = 200, -- update delay after a text change (in milliseconds)
      -- Define how various check-boxes are displayed
      checkboxes = {
        -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
        [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
        ["x"] = { char = "", hl_group = "ObsidianDone" },
        [">"] = { char = "", hl_group = "ObsidianRightArrow" },
        ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
        -- Replace the above with this if you don't have a patched font:
        -- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
        -- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

        -- You can also add more custom ones...
      },
      external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
      -- Replace the above with this if you don't have a patched font:
      -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
      reference_text = { hl_group = "ObsidianRefText" },
      highlight_text = { hl_group = "ObsidianHighlightText" },
      tags = { hl_group = "ObsidianTag" },
      hl_groups = {
        -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
        ObsidianTodo = { bold = true, fg = "#f78c6c" },
        ObsidianDone = { bold = true, fg = "#89ddff" },
        ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
        ObsidianTilde = { bold = true, fg = "#ff5370" },
        ObsidianRefText = { underline = true, fg = "#c792ea" },
        ObsidianExtLinkIcon = { fg = "#c792ea" },
        ObsidianTag = { italic = true, fg = "#89ddff" },
        ObsidianHighlightText = { bg = "#75662e" },
      },
    },
    note_id_func = function(title)
      local filename = ""

      if title ~= nil then
        filename = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        filename = tostring(os.time()) .. "-noname"
      end
      return filename
    end,
  },
  config = function(_, opts)
    require("obsidian").setup(opts)
    vim.keymap.set("n", "gd", function()
      if require("obsidian").util.cursor_on_markdown_link() then
        return "<cmd>ObsidianFollowLink<CR>"
      else
        return "gd"
      end
    end, { noremap = false, expr = true })
  end,
}
