local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

-- Create the battery arcchart widget
local battery_widget = wibox.widget({
	max_value = 100,
	thickness = 4,
	start_angle = 4.71238898038, -- 3/2 pi, starts at the top
	bg = "#2E3440", -- Background color of the arc
	colors = { "#88C0D0" }, -- Foreground color
	widget = wibox.container.arcchart,
})

-- Create a textbox to display the percentage inside the arc
local battery_text = wibox.widget({
	align = "center",
	valign = "center",
	font = "RobotoPropo Nerd Font 8",
	widget = wibox.widget.textbox,
})

-- Combine arc and text into a single widget
local battery_arc_widget = wibox.widget({
	{
		battery_widget,
		{
			battery_text,
			layout = wibox.layout.align.horizontal,
		},
		layout = wibox.layout.stack,
	},
	margins = 2,
	widget = wibox.container.margin,
})

-- Function to update the widget
local function update_battery_widget()
	-- Read battery capacity
	local capacity_file = "/sys/class/power_supply/BAT0/capacity"
	local status_file = "/sys/class/power_supply/BAT0/status"

	local capacity = tonumber(
		gears.filesystem.file_readable(capacity_file) and io.open(capacity_file):read("*all"):match("%d+") or 0
	)
	local status = gears.filesystem.file_readable(status_file) and io.open(status_file):read("*all"):match("%a+")
		or "Unknown"

	-- Update arc and text
	battery_widget.value = capacity
	battery_text.text = string.format("%d%%", capacity)

	-- Change color based on status or level
	if status == "Charging" then
		battery_widget.colors = { "#A3BE8C" } -- Green for charging
	elseif capacity <= 20 then
		battery_widget.colors = { "#BF616A" } -- Red for low battery
	else
		battery_widget.colors = { "#88C0D0" } -- Default color
	end
end

-- Periodically update the widget
gears.timer({
	timeout = 30,
	autostart = true,
	callback = update_battery_widget,
})

-- Initial update
update_battery_widget()

return battery_arc_widget
