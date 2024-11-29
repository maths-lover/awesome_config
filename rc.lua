-- awesome_mode: api-level=4:screen=on

-- load luarocks if installed
pcall(require, "luarocks.loader")

local awful = require("awful")
local beautiful = require("beautiful")

require("config.errorhandling")

-- {{{ On Startup or Restart of awesome execute following programs/scripts
awesome.connect_signal("startup", function(args)
	awful.util.spawn_with_shell("~/.config/awesome/config/autorun.sh")
end)
-- }}}

-- load theme
beautiful.init(awful.util.getdir("config") .. "themes/" .. require("config").vars.current_theme .. "/theme.lua")

-- set last set wallpaper using feh
-- using external wallpaper setter so that I can utilize matugen dynamic colors based on wallpaper
beautiful.get().wallpaper = function()
	-- Earlier I was using awful.spawn to set the wallpaper, but it would set
	-- the wallpaper on startup but not when I change the wallpaper with
	-- matugen again Apparantly the set_wallpaper function that I'm using
	-- in ~/.config/awesome/signals/screen/init.lua expects a string to be
	-- returned from this function and sets the wallpaper to that.
	-- Earlier I was setting the wallpaper with fehbg but instantly setting a
	-- black (nil) wallpapper with set_wallpaper function which was confusing
	-- to debug but here we are.
	--
	-- Thus, awful spawn will set the wallpaper, but we need to get the last set wallpaper with feh (matugen uses it)
	-- so we read ~/.fehbg file and get the filepath of the last wallpaper set
	-- the path is basically the string that is within the single quotes and after the command
	-- feh --no-fehbg --bg-scale '<PATH>'
	-- We need to extracth the <PATH> and trim any new lines or whitespaces
	local wallpaper_path = io.popen('cat ~/.fehbg | grep feh | cut -d "\'" -f2'):read("*a")
	local trimmed_wallpaper_path = string.gsub(wallpaper_path, "\n", "")
	return trimmed_wallpaper_path
end

-- load key and mouse bindings
require("bindings")

-- load rules
require("rules")

-- load signals
require("signals")
