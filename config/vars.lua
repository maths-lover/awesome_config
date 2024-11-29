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

_M.tags = { "", "", "󰦑", "", "󰇮", "󰹑", "", "󰖠", "" }

-- WARN: xdg_config_dir might not be needed afterall

local xdg_config_dir = os.getenv("XDG_CONFIG_HOME")
local home_dir = os.getenv("HOME")

_M.xdg_config_dir = xdg_config_dir
_M.wallpaper_dir = home_dir .. "/Pictures/Wallpapers/"

_M.current_theme = "awesome_maths"

return _M
