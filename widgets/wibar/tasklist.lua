local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")

local buttons = require("bindings.widgets.tasklist").buttons

-- awful.popup({
-- 	widget = awful.widget.tasklist({
-- 		screen = awful.screen.focused(),
-- 		filter = awful.widget.tasklist.filter.allscreen,
-- 		buttons = buttons,
-- 		style = {
-- 			shape = gears.shape.rounded_rect,
-- 		},
-- 		layout = {
-- 			spacing = 5,
-- 			forced_num_rows = 2,
-- 			layout = wibox.layout.grid.horizontal,
-- 		},
-- 		widget_template = {
-- 			{
-- 				{
-- 					id = "clienticon",
-- 					widget = awful.widget.clienticon,
-- 				},
-- 				margins = 4,
-- 				widget = wibox.container.margin,
-- 			},
-- 			id = "background_role",
-- 			forced_width = 48,
-- 			forced_height = 48,
-- 			widget = wibox.container.background,
-- 			create_callback = function(self, c, index, objects) --luacheck: no unused
-- 				self:get_children_by_id("clienticon")[1].client = c
-- 			end,
-- 		},
-- 	}),
-- 	border_color = beautiful.border_color_normal,
-- 	border_width = 2,
-- 	ontop = true,
-- 	placement = awful.placement.centered,
-- 	shape = gears.shape.rounded_rect,
-- })

return function(s)
	return awful.widget.tasklist({
		screen = s,
		filter = awful.widget.tasklist.filter.currenttags,
		buttons = buttons,
		style = {
			shape_border_width = 1,
			shape_border_color = beautiful.border_color_normal,
			shape = gears.shape.rounded_bar,
		},
		layout = {
			spacing = 10,
			spacing_widget = {
				{
					forced_width = 5,
					shape = gears.shape.circle,
					widget = wibox.widget.separator,
				},
				valign = "center",
				halign = "center",
				widget = wibox.container.place,
			},
			layout = wibox.layout.flex.horizontal,
		},
		-- Notice that there is *NO* wibox.wibox prefix, it is a template,
		-- not a widget instance.
		widget_template = {
			{
				{
					{
						{
							id = "icon_role",
							widget = wibox.widget.imagebox,
						},
						margins = 2,
						widget = wibox.container.margin,
					},
					{
						id = "text_role",
						widget = wibox.widget.textbox,
					},
					layout = wibox.layout.fixed.horizontal,
				},
				left = 10,
				right = 10,
				widget = wibox.container.margin,
			},
			id = "background_role",
			widget = wibox.container.background,
		},
	})
end
