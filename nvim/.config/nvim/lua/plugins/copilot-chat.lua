local function dynamic_title()
  local cfg = require("CopilotChat.config")
  return "🤖 Copilot Chat — Model: " .. (cfg.model or "unknown")
end

return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      -- See Configuration section for options
      window = {
        -- width = 80, -- Fixed width in columns
        -- height = 20, -- Fixed height in rows
        border = "rounded", -- 'single', 'double', 'rounded', 'solid'
        -- zindex = 100, -- Ensure window stays on top
      },

      headers = {
        user = "👤 You",
        assistant = dynamic_title(),
        tool = "🔧 Tool",
      },

      separator = "━━",
      auto_fold = true, -- Automatically folds non-assistant messages
    },
  },
}
