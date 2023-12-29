local awful = require "awful"
require "awful.autofocus"
-- load luarocks if installed
pcall(require, 'luarocks.loader')

-- local st = require("util.stalonetray")
-- st.start()

require 'config'
require 'themes'
require 'bindings'
require 'rules'
require 'signals'

awful.spawn.with_shell("picom")
awful.spawn.with_shell("flameshot")
awful.spawn.with_shell("nm-applet")
awful.spawn.with_shell("blueman-applet")
awful.spawn.with_shell("~/.screenlayout/two-monitor-layout.sh")
awful.spawn.with_shell("feh --bg-fill -r -z ~/wallpapers")
