-- local client = client
local awful = require("awful")
local lain = require("lain")

local mod = require("bindings.mod")

client.connect_signal("request::default_keybindings", function()
	awful.keyboard.append_client_keybindings({
		awful.key({
			modifiers = { mod.super },
			key = "f",
			description = "toggle fullscreen",
			group = "client",
			on_press = function(c)
				c.fullscreen = not c.fullscreen
				c:raise()
			end,
		}),
		awful.key({
			modifiers = { mod.super, mod.shift },
			key = "c",
			description = "close",
			group = "client",
			on_press = function(c)
				c:kill()
			end,
		}),
		awful.key({
			modifiers = { mod.super, mod.ctrl },
			key = "space",
			description = "toggle floating",
			group = "client",
			on_press = awful.client.floating.toggle,
		}),
		awful.key({
			modifiers = { mod.super, mod.ctrl },
			key = "Return",
			description = "move to master",
			group = "client",
			on_press = function(c)
				c:swap(awful.client.getmaster())
			end,
		}),
		awful.key({
			modifiers = { mod.super },
			key = "o",
			description = "move to screen",
			group = "client",
			on_press = function(c)
				c:move_to_screen()
			end,
		}),
		-- awful.key({
		-- 	modifiers = { mod.super },
		-- 	key = "t",
		-- 	description = "toggle keep on top",
		-- 	group = "client",
		-- 	on_press = function(c)
		-- 		c.ontop = not c.ontop
		-- 	end,
		-- }),
		awful.key({
			modifiers = { mod.super },
			key = "n",
			description = "minimize",
			group = "client",
			on_press = function(c)
				c.minimized = true
			end,
		}),
		awful.key({
			modifiers = { mod.super, mod.ctrl },
			key = "n",
			description = "unminimize",
			group = "client",
			on_press = function(c)
				c.minimized = false
			end,
		}),
		awful.key({
			modifiers = { mod.super },
			key = "m",
			description = "(un)maximize",
			group = "client",
			on_press = function(c)
				c.maximized = not c.maximized
				c:raise()
			end,
		}),
		awful.key({
			modifiers = { mod.super, mod.ctrl },
			key = "m",
			description = "(un)maximize vertically",
			group = "client",
			on_press = function(c)
				c.maximized_vertical = not c.maximized_vertical
				c:raise()
			end,
		}),
		awful.key({
			modifiers = { mod.super, mod.shift },
			key = "m",
			description = "(un)maximize horizontally",
			group = "client",
			on_press = function(c)
				c.maximized_horizontal = not c.maximized_horizontal
				c:raise()
			end,
		}),
		awful.key({
			modifiers = { mod.alt, mod.ctrl },
			key = "u",
			description = "Increment useless gaps",
			group = "client",
			on_press = function()
				lain.util.useless_gaps_resize(1)
			end,
		}),
		awful.key({
			modifiers = { mod.alt, mod.ctrl },
			key = "d",
			description = "Decrement useless gaps",
			group = "client",
			on_press = function()
				lain.util.useless_gaps_resize(-1)
			end,
		}),
		-- Client focus
		awful.key({
			modifiers = { mod.super },
			key = "h",
			description = "Focus next window left",
			group = "client",
			on_press = function(c)
				awful.client.focus.global_bydirection("left")
				c:lower()
			end,
		}),
		awful.key({
			modifiers = { mod.super },
			key = "j",
			description = "Focus next window down",
			group = "client",
			on_press = function(c)
				awful.client.focus.global_bydirection("down")
				c:lower()
			end,
		}),
		awful.key({
			modifiers = { mod.super },
			key = "k",
			description = "Focus next window up",
			group = "client",
			on_press = function(c)
				awful.client.focus.global_bydirection("up")
				c:lower()
			end,
		}),
		awful.key({
			modifiers = { mod.super },
			key = "l",
			description = "Focus next window right",
			group = "client",
			on_press = function(c)
				awful.client.focus.global_bydirection("right")
				c:lower()
			end,
		}),
		-- By-direction client swap
		awful.key({
			modifiers = { mod.super, mod.shift },
			key = "h",
			description = "Swap with right client",
			group = "client",
			on_press = function(c)
				awful.client.swap.global_bydirection("left")
				c:raise()
			end,
		}),
		awful.key({
			modifiers = { mod.super, mod.shift },
			key = "l",
			description = "Swap with left client",
			group = "client",
			on_press = function(c)
				awful.client.swap.global_bydirection("right")
				c:raise()
			end,
		}),
		awful.key({
			modifiers = { mod.super, mod.shift },
			key = "j",
			description = "Swap with up client",
			group = "client",
			on_press = function(c)
				awful.client.swap.global_bydirection("down")
				c:raise()
			end,
		}),
		awful.key({
			modifiers = { mod.super, mod.shift },
			key = "k",
			description = "Swap with down client",
			group = "client",
			on_press = function(c)
				awful.client.swap.global_bydirection("up")
				c:raise()
			end,
		}),
		-- Alt-tab like with rofi
		awful.key({
			modifiers = { mod.super },
			key = "t",
			description = "trigger a window list",
			group = "client",
			on_press = function()
				awful.spawn("rofi -show window -show-icons")
			end,
		}),
	})
end)
