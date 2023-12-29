local awful   = require 'awful'
local gears   = require 'gears'
local wibox   = require 'wibox'
local dpi     = require("beautiful.xresources").apply_dpi
local debug   = require 'utils.functions'.mydebug
local buttons = require 'bindings.widgets.taglist'.buttons

return function(s, theme)
    local barcolor = gears.color({
        type  = "linear",
        from  = { dpi(50, s), 0 },
        to    = { dpi(50, s), dpi(50, s) },
        stops = { { 0, theme.bg_focus }, { 0.25, "#505050" }, { 1, theme.bg_focus } }
    })

    local taglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, buttons, { bg_focus = barcolor })
    local taglistContainer = wibox.container.background(taglist, theme.bg_focus, gears.shape.rectangle)

    return wibox.container.margin(taglistContainer, dpi(5), dpi(0), dpi(5), dpi(5))
end
