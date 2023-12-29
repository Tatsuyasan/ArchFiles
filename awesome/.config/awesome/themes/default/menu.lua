local M = {}

local awful = require 'awful'
local hotkeys_popup = require 'awful.hotkeys_popup'
local beautiful = require 'beautiful'

local apps = require 'config.apps'

M.awesomemenu = {
    { 'hotkeys', function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
    { 'manual', apps.manual_cmd },
    { 'edit config', apps.editor_cmd .. ' ' .. awesome.conffile },
    { 'restart', awesome.restart },
    { 'quit', awesome.quit },
}

M.mainmenu = awful.menu {
    items = {
        { 'awesome', M.awesomemenu, beautiful.awesome_icon },
        { 'open terminal', apps.terminal }
    }
}

M.launcher = awful.widget.launcher {
    image = beautiful.awesome_icon,
    menu = M.mainmenu
}

return M
