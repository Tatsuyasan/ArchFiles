local awful   = require 'awful'
local wibox   = require 'wibox'
local gears   = require 'gears'
local dpi     = require("beautiful.xresources").apply_dpi
local buttons = require 'bindings.widgets.layoutbox'.buttons

return function(s, theme)
    local layoutbox = wibox.container.margin(awful.widget.layoutbox {
        screen = s,
        buttons = buttons,
    }, dpi(5), dpi(5), dpi(0), dpi(0))

    local layoutboxContainer = wibox.container.background(layoutbox, theme.bg_focus, gears.shape.rectangle)

    return wibox.container.margin(layoutboxContainer, dpi(-1), dpi(5), dpi(5), dpi(5))
    -- return awful.widget.layoutbox {
    --     screen = s,
    --     buttons = buttons,
    -- }
end
