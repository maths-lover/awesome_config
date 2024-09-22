--------------------------------------
-- "awesome_maths" awesome theme    --
--       By "Suraj" Pal Singh       --
--------------------------------------
-- If you want SVGs and extras, get them from garoth.com/awesome/sky-theme

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local rnotification = require("ruled.notification")
local dpi = xresources.apply_dpi
local xdg_config_dir = os.getenv("XDG_CONFIG_HOME")
local awesome_theme_dir = ""
if xdg_config_dir then
	awesome_theme_dir = xdg_config_dir .. "/awesome/themes/"
else
	awesome_theme_dir = os.getenv("HOME") .. ".config/awesome/themes/"
end
local themes_path = awesome_theme_dir
-- local naughty = require("naughty")
--
-- naughty.notify({
-- 	preset = naughty.config.presets.critical,
-- 	title = "Themes Path",
-- 	text = tostring(themes_path),
-- })

-- BASICS
local theme = {}
theme.font = "Roboto 10"

theme.bg_focus = "{{colors.primary.default.hex}}"
theme.bg_normal = "{{colors.secondary_fixed_dim.default.hex}}"
theme.bg_urgent = "{{colors.primary_container.default.hex}}"
theme.bg_minimize = "{{colors.tertiary.default.hex}}"
theme.bg_systray = theme.bg_normal

theme.fg_focus = "{{colors.on_primary.default.hex}}"
theme.fg_normal = "{{colors.on_secondary_fixed.default.hex}}"
theme.fg_urgent = "{{colors.on_primary_container.default.hex}}"
theme.fg_minimize = "{{colors.on_tertiary.default.hex}}"

theme.useless_gap = dpi(3)
theme.border_width = dpi(2)
theme.border_color_normal = "{{colors.secondary.default.hex}}"
theme.border_color_active = "{{colors.primary.default.hex}}"
theme.border_color_marked = "{{colors.on_primary_container.default.hex}}"

-- IMAGES
theme.layout_fairh = themes_path .. "awesome_maths/layouts/fairh.png"
theme.layout_fairv = themes_path .. "awesome_maths/layouts/fairv.png"
theme.layout_floating = themes_path .. "awesome_maths/layouts/floating.png"
theme.layout_magnifier = themes_path .. "awesome_maths/layouts/magnifier.png"
theme.layout_max = themes_path .. "awesome_maths/layouts/max.png"
theme.layout_fullscreen = themes_path .. "awesome_maths/layouts/fullscreen.png"
theme.layout_tilebottom = themes_path .. "awesome_maths/layouts/tilebottom.png"
theme.layout_tileleft = themes_path .. "awesome_maths/layouts/tileleft.png"
theme.layout_tile = themes_path .. "awesome_maths/layouts/tile.png"
theme.layout_tiletop = themes_path .. "awesome_maths/layouts/tiletop.png"
theme.layout_spiral = themes_path .. "awesome_maths/layouts/spiral.png"
theme.layout_dwindle = themes_path .. "awesome_maths/layouts/dwindle.png"
theme.layout_cornernw = themes_path .. "awesome_maths/layouts/cornernw.png"
theme.layout_cornerne = themes_path .. "awesome_maths/layouts/cornerne.png"
theme.layout_cornersw = themes_path .. "awesome_maths/layouts/cornersw.png"
theme.layout_cornerse = themes_path .. "awesome_maths/layouts/cornerse.png"

theme.awesome_icon = themes_path .. "awesome_maths/awesome-icon.png"

-- from default for now...
theme.menu_submenu_icon = themes_path .. "default/submenu.png"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)

-- MISC
theme.wallpaper = themes_path .. "default/background.png"
theme.taglist_squares = "true"
theme.titlebar_close_button = "true"
theme.menu_height = dpi(15)
theme.menu_width = dpi(100)

-- Define the image to load
theme.titlebar_close_button_normal = themes_path .. "default/titlebar/close_normal.png"
theme.titlebar_close_button_focus = themes_path .. "default/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path .. "default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus = themes_path .. "default/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = themes_path .. "default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive = themes_path .. "default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path .. "default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active = themes_path .. "default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path .. "default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive = themes_path .. "default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path .. "default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active = themes_path .. "default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path .. "default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive = themes_path .. "default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path .. "default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active = themes_path .. "default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path .. "default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive = themes_path .. "default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path .. "default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active = themes_path .. "default/titlebar/maximized_focus_active.png"

-- Set different colors for urgent notifications.
rnotification.connect_signal("request::rules", function()
	rnotification.append_rule({
		rule = { urgency = "critical" },
		properties = { bg = "{{colors.error.default.hex}}", fg = "{{colors.on_error.default.hex}}" },
	}, {
		rule = { urgency = "normal" },
		properties = { bg = "{{colors.primary.default.hex}}", fg = "{{colors.on_primary.default.hex}}" },
	}, {
		rule = { urgency = "low" },
		properties = { bg = "{{colors.tertiary_fixed.default.hex}}", fg = "{{colors.on_tertiary_fixed.default.hex}}" },
	})
end)

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
