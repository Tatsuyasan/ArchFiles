local wibox = require 'wibox'
local dpi   = require("beautiful.xresources").apply_dpi

return function(theme)
    local systray = wibox.widget.systray(false)
    -- systray.opacity = 0
    systray.base_size = 30
    -- systray.set_h_margin(10)

    return wibox.container.margin(
        systray,
        dpi(0), dpi(-20), dpi(5), dpi(5)
    )
end
