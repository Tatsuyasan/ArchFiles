return {
  "smoka7/hop.nvim",
  version = "*",
  opts = { setup = { keys = "etovxqpdygfblzhckisuran" } },
  keys = {
    {
      "S",
      function()
        require("hop").hint_words({})
      end,
      desc = "Go to word",
    },
    {
      "f",
      function()
        require("hop").hint_char1({
          direction = require("hop.hint").HintDirection.AFTER_CURSOR,
          current_line_only = true,
        })
      end,
      desc = "Go on next word on line",
    },
    {
      "F",
      function()
        require("hop").hint_char1({
          direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
          current_line_only = true,
        })
      end,
      desc = "Go on previous letter on line",
    },
    {
      "t",
      function()
        require("hop").hint_char1({
          direction = require("hop.hint").HintDirection.AFTER_CURSOR,
          current_line_only = true,
          hint_offset = -1,
        })
      end,
      desc = "Go before the previous word on line",
    },
    {
      "T",
      function()
        require("hop").hint_char1({
          direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
          current_line_only = true,
          hint_offset = 1,
        })
      end,
      desc = "Go before the previous word on line",
    },
  },
}
