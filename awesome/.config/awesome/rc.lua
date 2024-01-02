local awful = require("awful")
require("awful.autofocus")
-- load luarocks if installed
pcall(require, "luarocks.loader")

-- local st = require("util.stalonetray")
-- st.start()

require("themes")
require("config")
require("bindings")
require("rules")
require("signals")

awful.spawn.with_shell("picom")
awful.spawn.with_shell("xbanish")
awful.spawn.with_shell("flameshot")
awful.spawn.with_shell("nm-applet")
awful.spawn.with_shell("blueman-applet")
awful.spawn.with_shell("pasystray")
awful.spawn.with_shell("~/.screenlayout/home.sh")
awful.spawn.with_shell("feh --bg-fill -r -z ~/wallpapers")
