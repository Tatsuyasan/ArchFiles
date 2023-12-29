local awful = require 'awful'

local vars = require 'config.vars'
local debug = require 'utils.functions'.mydebug

tag.connect_signal('request::default_layouts', function()
    -- debug('sld')
    --     -- naughty.notify({ title = "Debug", text = t, timeout = 0 })
    --     -- if t.screen.index == 1 then
    --     --     -- create tags for screen 1
    --     --     awful.tag(vars.tags, screen[1], vars.layouts.horizontal_screen[1])
    --     --     awful.layout.append_default_layouts(vars.layouts.horizontal_screen)
    --     -- elseif t.screen.index == 2 then
    --     --     -- create tags for screen 2
    --     --     awful.tag(vars.tags, screen[2], vars.layouts.vertical_screen[1])
    --     --     awful.layout.append_default_layouts(vars.layouts.vertical_screen)
    --     -- end
    -- awful.layout.append_default_layouts(vars.layouts.vertical)
end)
