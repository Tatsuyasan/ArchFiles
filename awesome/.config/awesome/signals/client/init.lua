local client = client
local awful = require 'awful'
require 'awful.autofocus'
local wibox = require 'wibox'
local beautiful = require 'beautiful'

-- client.connect_signal('mouse::enter', function(c)
--     c:activate { context = 'mouse_enter', raise = false }
-- end)

-- client.connect_signal("focus", function(c)
--     c.border_color = beautiful.border_focus
-- end)
-- client.connect_signal("unfocus", function(c)
--     c.border_color = beautiful.border_normal
-- end)

client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", { raise = true })
end)

-- No border for maximized clients
local function border_adjust(c)
    if c.maximized then -- no borders if only 1 client visible
        c.border_width = 0
    elseif #awful.screen.focused().clients > 1 then
        c.border_width = beautiful.border_width
        c.border_color = beautiful.border_focus
    end
end

client.connect_signal("focus", border_adjust)
client.connect_signal("property::maximized", border_adjust)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

client.connect_signal("property::floating", function(c)
    if c.floating then
        c.ontop = true
    else
        c.ontop = false
    end
end)

client.connect_signal('request::titlebars', function(c)
    -- buttons for the titlebar
    local buttons = {
        awful.button {
            modifiers = {},
            button    = 1,
            on_press  = function()
                c:activate { context = 'titlebar', action = 'mouse_move' }
            end
        },
        awful.button {
            modifiers = {},
            button    = 3,
            on_press  = function()
                c:activate { context = 'titlebar', action = 'mouse_resize' }
            end
        },
    }

    awful.titlebar(c).widget = {
        -- left
        {
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal,
        },
        -- middle
        {
            -- title
            {
                align = 'center',
                widget = awful.titlebar.widget.titlewidget(c),
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal,
        },
        -- right
        {
            awful.titlebar.widget.floatingbutton(c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton(c),
            awful.titlebar.widget.ontopbutton(c),
            awful.titlebar.widget.closebutton(c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal,
    }
end)
