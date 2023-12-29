local awful = require 'awful'
local wibox = require 'wibox'

return function(s, theme)
    local mytextclock = wibox.widget.textclock()
    local month_calendar = awful.widget.calendar_popup.year {
        screen = s,
        style_focus = { bg_color = theme.border_focus },
        spacing = 10,
        margin = 20,
    }
    month_calendar:attach(mytextclock, "c")
    return mytextclock
end
