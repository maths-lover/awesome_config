local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")

local vars = require("config.vars")
local widgets = require("widgets")

local function set_wallpaper(s)
	-- Wallpaper
	if beautiful.wallpaper then
		local wallpaper = beautiful.wallpaper
		-- If wallpaper is a function, call it with the screen
		if type(wallpaper) == "function" then
			wallpaper = wallpaper(s)
		end
		gears.wallpaper.maximized(wallpaper, s, true)
	end
end

screen.connect_signal("request::wallpaper", set_wallpaper)

screen.connect_signal("request::desktop_decoration", function(s)
	awful.tag(vars.tags, s, awful.layout.layouts[1])
	widgets.wibar(s)
end)
