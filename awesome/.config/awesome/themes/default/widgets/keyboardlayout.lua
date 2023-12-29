local wibox = require 'wibox'
local awful = require 'awful'
local gears = require 'gears'
local dpi   = require("beautiful.xresources").apply_dpi

return function(theme)
    return wibox.container.margin(
        wibox.container.background(
            awful.widget.keyboardlayout(),
            theme.bg_focus,
            gears.shape.rectangle_tag
        ),
        dpi(0), dpi(5), dpi(5), dpi(5)
    )

end
