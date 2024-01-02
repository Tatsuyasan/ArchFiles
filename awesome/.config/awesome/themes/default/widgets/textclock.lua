local awful = require("awful")
local wibox = require("wibox")
local calendar_widget = require("themes.default.widgets.calendar")

return function(s, theme)
	local mytextclock = wibox.widget.textclock()
	local cw = calendar_widget({
		theme = "nord",
		start_sunday = true,
		radius = 2,
	})

	mytextclock:connect_signal("button::press", function(_, _, _, button)
		if button == 1 then
			cw.toggle()
		end
	end)

	return mytextclock
end
