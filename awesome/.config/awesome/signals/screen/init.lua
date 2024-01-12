local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")
local naughty = require("naughty")

local vars = require("config.vars")

screen.connect_signal("request::wallpaper", function(s)
	awful.wallpaper({
		screen = s,
		widget = {
			{
				image = beautiful.wallpaper,
				upscale = true,
				downscale = true,
				widget = wibox.widget.imagebox,
			},
			valign = "center",
			halign = "center",
			tiled = false,
			widget = wibox.container.tile,
		},
	})
end)

screen.connect_signal("request::desktop_decoration", function(s)
	-- Each screen has its own layouts.
	if s.index == 2 then
		-- create tags for screen 2
		awful.tag(vars.tags, s, vars.layouts.vertical)

		return
	end

	awful.tag(vars.tags, s, vars.layouts.horizontal)
end)
