local lain  = require 'lain'
local dpi   = require("beautiful.xresources").apply_dpi
local wibox = require 'wibox'
-- local markup = lain.util.markup

return function(s, theme)
    if s.index == 2 then
        return nil
    end

    local net = lain.widget.net({
        settings = function()
            -- widget:set_markup(markup.font("Roboto 1", " ") .. markup.font(theme.font, net_now.received .. " - "
            --     .. net_now.sent) .. markup.font("Roboto 2", " "))
            widget:set_markup('<b>' .. net_now.received .. ' - ' .. net_now.sent .. '</b>')
        end
    })
    net.widget:set_align('center')

    local constraintNet = wibox.container.constraint(
        net,
        'exact', 80, nil
    )

    local netBackground = wibox.container.background(
        constraintNet,
        theme.bg_focus
    )

    return wibox.widget {
        s.icons.netup_icon,
        s.icons.spr_bar,
        wibox.container.margin(
            netBackground,
            dpi(-1), dpi(-1), dpi(5), dpi(5)
        ),
        s.icons.spr_bar,
        wibox.container.margin(
            s.icons.netdown_icon,
            dpi(-1), dpi(0), dpi(0), dpi(0)
        ),
        layout = wibox.layout.fixed.horizontal
    }

end
