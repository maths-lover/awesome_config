local awful = require("awful")
local wibox = require("wibox")

local menu = require("widgets.menu")
local taglist = require("widgets.wibar.taglist")
local tasklist = require("widgets.wibar.tasklist")
local layoutbox = require("widgets.wibar.layoutbox")

return function(s)
	s.widgets = {
		layoutbox = layoutbox(s),
		taglist = taglist(s),
		tasklist = tasklist(s),
		keyboardlayout = awful.widget.keyboardlayout(),
		promptbox = awful.widget.prompt(),
		systray = wibox.widget.systray(),
		textclock = wibox.widget.textclock(),
	}

	-- set systray to be in vertical only
	s.widgets.systray:set_horizontal(true)

	s.widgets.wibar = awful.wibar({
		screen = s,
		position = "top",
		widget = {
			layout = wibox.layout.align.horizontal,
			-- top widgets
			{
				layout = wibox.layout.fixed.horizontal,
				menu.launcher,
				s.widgets.taglist,
				s.widgets.promptbox,
			},
			-- middle widgets
			s.widgets.tasklist,
			-- bottom widgets
			{
				layout = wibox.layout.fixed.horizontal,
				s.widgets.keyboardlayout,
				s.widgets.systray,
				s.widgets.textclock,
				s.widgets.layoutbox,
			},
		},
	})
end
