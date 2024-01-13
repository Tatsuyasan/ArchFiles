local awful = require("awful")
local wibox = require("wibox")
local dpi = require("beautiful.xresources").apply_dpi

local battery_widget = require("battery-widget")
local battery = battery_widget:new({})
local menu = require("themes.default.menu")
local net = require("themes.default.widgets.net")
local systray = require("themes.default.widgets.systray")
local taglist = require("themes.default.widgets.taglist")
local tasklist = require("themes.default.widgets.tasklist")
local textclock = require("themes.default.widgets.textclock")
local layoutbox = require("themes.default.widgets.layoutbox")
local layoutlist = require("themes.default.widgets.layoutlist")
local logoutmenu = require("themes.default.widgets.logout-menu-widget.logout-menu")
local keyboardlayout = require("themes.default.widgets.keyboardlayout")

return function(s, theme)
	s.menu = menu

	s.icons = {
		spr_bar = wibox.widget.imagebox(theme.spr_bar),
		netdown_icon = wibox.widget.imagebox(theme.net_down),
		netup_icon = wibox.widget.imagebox(theme.net_up),
	}

	s.widgets = {
		layoutbox = layoutbox(s, theme),
		layoutlist = layoutlist,
		taglist = taglist(s, theme),
		tasklist = tasklist(s),
		keyboardlayout = keyboardlayout(theme),
		promptbox = awful.widget.prompt(),
		net = net(s, theme),
		systray = systray(theme),
		textclock = textclock(s, theme),
	}

	s.wibar = awful.wibar({
		screen = s,
		height = theme.wibar_height,
		position = theme.wibar_position,
		opacity = theme.wibar_opacity,
		margins = theme.wibar_margins,
		widget = {
			layout = wibox.layout.align.horizontal,
			{
				-- left widgets
				layout = wibox.layout.fixed.horizontal,
				s.widgets.taglist,
				s.icons.spr_bar,
				s.widgets.layoutbox,
				-- s.widgets.promptbox,
			},
			-- middle widgets
			-- s.widgets.textclock,
			wibox.container.place(s.widgets.textclock, "center", "center"),
			{
				-- right widgets
				layout = wibox.layout.fixed.horizontal,
				s.widgets.systray,
				screen.primary == s and wibox.container.margin(battery.widget, dpi(-1), dpi(10), dpi(5), dpi(5)) or nil,
				screen.primary == s and wibox.container.margin(
					logoutmenu({
						font = "Hack Nerd Font",
						onlock = function()
							awful.spawn.with_shell("betterlockscreen -l dim --display 1")
						end,
					}),
					dpi(-1),
					dpi(10),
					dpi(5),
					dpi(5)
				) or nil,
				s.widgets.net,
				s.widgets.keyboardlayout,
			},
		},
	})
end
