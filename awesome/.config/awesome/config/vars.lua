local M = {}

local awful = require("awful")

awful.layout.suit.tile.vertical = require("layouts.vertical")

M.layouts = {
	vertical = {
		awful.layout.suit.tile.vertical,
		-- require 'layouts.vertical',
		-- awful.layout.suit.tile,
		-- awful.layout.suit.tile.left,
		awful.layout.suit.tile.bottom,
		awful.layout.suit.tile.top,
		awful.layout.suit.floating,
		-- awful.layout.suit.fair,
		-- awful.layout.suit.fair.horizontal,
		-- awful.layout.suit.spiral,
		-- awful.layout.suit.spiral.dwindle,
		-- awful.layout.suit.max,
		-- awful.layout.suit.max.fullscreen,
		-- awful.layout.suit.magnifier,
		-- awful.layout.suit.corner.nw,
	},
	horizontal = {
		awful.layout.suit.tile,
		awful.layout.suit.tile.left,
		awful.layout.suit.tile.bottom,
		awful.layout.suit.tile.top,
		awful.layout.suit.floating,
		-- awful.layout.suit.fair,
		-- awful.layout.suit.fair.horizontal,
		-- awful.layout.suit.spiral,
		-- awful.layout.suit.spiral.dwindle,
		-- awful.layout.suit.max,
		-- awful.layout.suit.max.fullscreen,
		-- awful.layout.suit.magnifier,
		-- awful.layout.suit.corner.nw,
	},
}

-- M.tags = { '1', '2', '3', '4', '5' }
-- M.tags = { " ", " ", " ", " ", " ", " ", " ", " ", " ", " " }
-- M.tags = { " ", " ", " ", " ", " " }
-- M.tags = { " DEV ", " WWW ", " SYS ", " DOC ", " VBOX ", " CHAT ", " MUS ", " VID ", " GFX " }
M.tags = { " TERMINAL ", " WEB ", " FILES ", " OTHER " }
-- M.newTags = {
--     {
--         names = { "爵", "", "", "", "拾" },
--         layout = { M.layouts.horizontal[1], M.layouts.horizontal[1], M.layouts.horizontal[1],
--             M.layouts.horizontal[1], M.layouts.horizontal[1] }
--     },
--     {
--         names = { "爵", "", "阮", "", "" },
--         layout = { M.layouts.vertical_screen[1], M.layouts.vertical_screen[1], M.layouts.vertical_screen[1],
--             M.layouts.vertical_screen[1], M.layouts.vertical_screen[1] }
--     }
-- }

return M
