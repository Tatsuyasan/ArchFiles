local beautiful = require("beautiful")

local themes = {
	"default", -- 1
	-- "other", -- 2
}

local chosen_theme = themes[1]
local theme_path = string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), chosen_theme)

beautiful.init(theme_path)

return { chosen_theme = chosen_theme }
