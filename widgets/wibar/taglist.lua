local awful = require("awful")
local wibox = require("wibox")

local buttons = require("bindings.widgets.taglist").buttons

return function(s)
	return awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = buttons,
		layout = {
			layout = wibox.layout.fixed.horizontal,
		},
	})
end
