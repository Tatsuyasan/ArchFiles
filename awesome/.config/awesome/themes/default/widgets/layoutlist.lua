local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local naughty = require("naughty")
local beautiful = require("beautiful")
local mod = require("bindings.mod")

local M = {
	popupLayoutLists = {},
}

screen.connect_signal("request::desktop_decoration", function(s)
	-- naughty.notify({ message = tostring(s.index) })

	local ll = awful.widget.layoutlist({
		screen = s,
		base_layout = wibox.widget({
			-- spacing         = 25,
			forced_num_cols = 4,
			layout = wibox.layout.grid.vertical,
		}),
		widget_template = {
			{
				{
					id = "icon_role",
					forced_height = 25,
					forced_width = 25,
					widget = wibox.widget.imagebox,
				},
				margins = 20,
				widget = wibox.container.margin,
			},
			id = "background_role",
			forced_width = 125,
			forced_height = 125,
			shape = gears.shape.rounded_rect,
			widget = wibox.container.background,
		},
	})

	local popup = awful.popup({
		widget = wibox.widget({
			ll,
			margins = 4,
			widget = wibox.container.margin,
		}),
		screen = s,
		opacity = 0.5,
		border_color = beautiful.border_color,
		border_width = beautiful.border_width,
		placement = awful.placement.centered,
		ontop = true,
		visible = false,
		shape = gears.shape.rounded_rect,
	})

	table.insert(M.popupLayoutLists, popup)
end)

awful.keygrabber({
	start_callback = function()
		local s = awful.screen.focused()
		M.popupLayoutLists[s.index].visible = true
	end,
	stop_callback = function()
		local s = awful.screen.focused()
		M.popupLayoutLists[s.index].visible = false
	end,
	export_keybindings = false,
	stop_event = "release",
	stop_key = { "Escape", "Super_L", "Super_R" },
	root_keybindings = {
		{ { mod.super }, "space", function() end },
	},
	keybindings = {
		{
			{ mod.super },
			"h",
			function()
				awful.layout.inc(-1)
			end,
		},

		{
			{ mod.super },
			"l",
			function()
				awful.layout.inc(1)
			end,
		},
	},
})

return M
