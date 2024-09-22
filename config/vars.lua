local _M = {}

local awful = require("awful")

_M.layouts = {
	awful.layout.suit.fair,
	awful.layout.suit.magnifier,
	awful.layout.suit.tile,
	awful.layout.suit.tile.left,
	awful.layout.suit.tile.bottom,
	awful.layout.suit.tile.top,
	awful.layout.suit.fair.horizontal,
	awful.layout.suit.spiral,
	awful.layout.suit.spiral.dwindle,
	awful.layout.suit.max,
	awful.layout.suit.max.fullscreen,
	awful.layout.suit.floating,
	awful.layout.suit.corner.nw,
}

_M.tags = { " ", " ", "󰦑 ", " ", " ", "󰹑 ", " ", " ", "󰭹 " }

local xdg_config_dir = os.getenv("XDG_CONFIG_HOME")
local home_dir = os.getenv("HOME")
local awesome_theme_dir = ""
if xdg_config_dir then
	awesome_theme_dir = xdg_config_dir .. "/awesome/themes/"
else
	awesome_theme_dir = os.getenv("HOME") .. ".config/awesome/themes/"
end

_M.xdg_config_dir = xdg_config_dir
_M.awesome_theme_dir = awesome_theme_dir
_M.wallpaper_dir = home_dir .. "/Pictures/Wallpapers/"

return _M
