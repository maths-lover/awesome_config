local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")
local menubar = require("menubar")

local apps = require("config.apps")
local mod = require("bindings.mod")
local widgets = require("widgets")

menubar.utils.terminal = apps.terminal

-- general awesome keys
awful.keyboard.append_global_keybindings({
	awful.key({
		modifiers = { mod.super, mod.shift },
		key = "/",
		description = "show help",
		group = "awesome",
		on_press = hotkeys_popup.show_help,
	}),
	awful.key({
		modifiers = { mod.super },
		key = "w",
		description = "show main menu",
		group = "awesome",
		on_press = function()
			widgets.menu.mainmenu:show()
		end,
	}),
	awful.key({
		modifiers = { mod.super, mod.ctrl },
		key = "r",
		description = "reload awesome",
		group = "awesome",
		on_press = awesome.restart,
	}),
	awful.key({
		modifiers = { mod.super, mod.shift },
		key = "q",
		description = "quit awesome",
		group = "awesome",
		on_press = awesome.quit,
	}),
	awful.key({
		modifiers = { mod.super },
		key = "x",
		description = "lua execute prompt",
		group = "awesome",
		on_press = function()
			awful.prompt.run({
				prompt = "Run Lua code: ",
				textbox = awful.screen.focused().widgets.promptbox.widget,
				exe_callback = awful.util.eval,
				history_path = awful.util.get_cache_dir() .. "/history_eval",
			})
		end,
	}),
	awful.key({
		modifiers = { mod.super },
		key = "Return",
		description = "open a terminal",
		group = "launcher",
		on_press = function()
			awful.spawn(apps.terminal)
		end,
	}),
	awful.key({
		modifiers = { mod.super },
		key = "r",
		description = "run prompt",
		group = "launcher",
		on_press = function()
			awful.screen.focused().widgets.promptbox:run()
		end,
	}),
	awful.key({
		modifiers = { mod.super },
		key = "p",
		description = "show the menubar",
		group = "launcher",
		on_press = function()
			menubar.show()
		end,
	}),
})

-- tags related keybindings
awful.keyboard.append_global_keybindings({
	awful.key({
		modifiers = { mod.super },
		key = "Left",
		description = "view preivous",
		group = "tag",
		on_press = awful.tag.viewprev,
	}),
	awful.key({
		modifiers = { mod.super },
		key = "Right",
		description = "view next",
		group = "tag",
		on_press = awful.tag.viewnext,
	}),
	awful.key({
		modifiers = { mod.super },
		key = ".",
		description = "go back",
		group = "tag",
		on_press = awful.tag.history.restore,
	}),
})

-- focus related keybindings
awful.keyboard.append_global_keybindings({
	awful.key({
		modifiers = { mod.super },
		key = "j",
		description = "focus next by index",
		group = "client",
		on_press = function()
			awful.client.focus.byidx(1)
		end,
	}),
	awful.key({
		modifiers = { mod.super },
		key = "k",
		description = "focus previous by index",
		group = "client",
		on_press = function()
			awful.client.focus.byidx(-1)
		end,
	}),
	awful.key({
		modifiers = { mod.super },
		key = "Tab",
		description = "go back",
		group = "client",
		on_press = function()
			awful.client.focus.history.previous()
			if client.focus then
				client.focus:raise()
			end
		end,
	}),
	awful.key({
		modifiers = { mod.super, mod.ctrl },
		key = "j",
		description = "focus the next screen",
		group = "screen",
		on_press = function()
			awful.screen.focus_relative(1)
		end,
	}),
	awful.key({
		modifiers = { mod.super, mod.ctrl },
		key = "k",
		description = "focus the previous screen",
		group = "screen",
		on_press = function()
			awful.screen.focus_relative(-1)
		end,
	}),
	awful.key({
		modifiers = { mod.super, mod.ctrl },
		key = "n",
		description = "restore minimized",
		group = "client",
		on_press = function()
			awful.client.restore()
		end,
	}),
})

-- layout related keybindings
awful.keyboard.append_global_keybindings({
	awful.key({
		modifiers = { mod.super, mod.shift },
		key = "j",
		description = "swap with next client by index",
		group = "client",
		on_press = function()
			awful.client.swap.byidx(1)
		end,
	}),
	awful.key({
		modifiers = { mod.super, mod.shift },
		key = "k",
		description = "swap with previous client by index",
		group = "client",
		on_press = function()
			awful.client.swap.byidx(-1)
		end,
	}),
	awful.key({
		modifiers = { mod.super },
		key = "u",
		description = "jump to urgent client",
		group = "client",
		on_press = awful.client.urgent.jumpto,
	}),
	awful.key({
		modifiers = { mod.super },
		key = "l",
		description = "increase master width factor",
		group = "layout",
		on_press = function()
			awful.tag.incmwfact(0.05)
		end,
	}),
	awful.key({
		modifiers = { mod.super },
		key = "h",
		description = "decrease master width factor",
		group = "layout",
		on_press = function()
			awful.tag.incmwfact(-0.05)
		end,
	}),
	awful.key({
		modifiers = { mod.super, mod.shift },
		key = "h",
		description = "increase the number of master clients",
		group = "layout",
		on_press = function()
			awful.tag.incnmaster(1, nil, true)
		end,
	}),
	awful.key({
		modifiers = { mod.super, mod.shift },
		key = "l",
		description = "decrease the number of master clients",
		group = "layout",
		on_press = function()
			awful.tag.incnmaster(-1, nil, true)
		end,
	}),
	awful.key({
		modifiers = { mod.super, mod.ctrl },
		key = "h",
		description = "increase the number of columns",
		group = "layout",
		on_press = function()
			awful.tag.incnmaster(1, nil, true)
		end,
	}),
	awful.key({
		modifiers = { mod.super, mod.ctrl },
		key = "l",
		description = "decrease the number of columns",
		group = "layout",
		on_press = function()
			awful.tag.incnmaster(-1, nil, true)
		end,
	}),
	awful.key({
		modifiers = { mod.super },
		key = "space",
		description = "select next",
		group = "layout",
		on_press = function()
			awful.layout.inc(1)
		end,
	}),
	awful.key({
		modifiers = { mod.super, mod.shift },
		key = "space",
		description = "select previous",
		group = "layout",
		on_press = function()
			awful.layout.inc(-1)
		end,
	}),
})

awful.keyboard.append_global_keybindings({
	awful.key({
		modifiers = { mod.super },
		keygroup = "numrow",
		description = "only view tag",
		group = "tag",
		on_press = function(index)
			local screen = awful.screen.focused()
			local tag = screen.tags[index]
			if tag then
				tag:view_only(tag)
			end
		end,
	}),
	awful.key({
		modifiers = { mod.super, mod.ctrl },
		keygroup = "numrow",
		description = "toggle tag",
		group = "tag",
		on_press = function(index)
			local screen = awful.screen.focused()
			local tag = screen.tags[index]
			if tag then
				tag:viewtoggle(tag)
			end
		end,
	}),
	awful.key({
		modifiers = { mod.super, mod.shift },
		keygroup = "numrow",
		description = "move focused client to tag",
		group = "tag",
		on_press = function(index)
			if client.focus then
				local tag = client.focus.screen.tags[index]
				if tag then
					client.focus:move_to_tag(tag)
				end
			end
		end,
	}),
	awful.key({
		modifiers = { mod.super, mod.ctrl, mod.shift },
		keygroup = "numrow",
		description = "toggle focused client on tag",
		group = "tag",
		on_press = function(index)
			if client.focus then
				local tag = client.focus.screen.tags[index]
				if tag then
					client.focus:toggle_tag(tag)
				end
			end
		end,
	}),
	awful.key({
		modifiers = { mod.super },
		keygroup = "numpad",
		description = "select layout directrly",
		group = "layout",
		on_press = function(index)
			local tag = awful.screen.focused().selected_tag
			if tag then
				tag.layout = tag.layouts[index] or tag.layout
			end
		end,
	}),

	-- Volume control
	awful.key({
		modifiers = {},
		key = "XF86AudioRaiseVolume",
		description = "Increase volume by 5%",
		group = "Multimedia",
		on_press = function()
			awful.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%")
		end,
	}),
	awful.key({
		modifiers = {},
		key = "XF86AudioLowerVolume",
		description = "Decrease volume by 5%",
		group = "Multimedia",
		on_press = function()
			awful.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%")
		end,
	}),
	awful.key({
		modifiers = {},
		key = "XF86AudioMute",
		description = "Decrease volume by 5%",
		group = "Multimedia",
		on_press = function()
			awful.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")
		end,
	}),
	awful.key({
		modifiers = {},
		key = "XF86AudioMicMute",
		description = "Decrease volume by 5%",
		group = "Multimedia",
		on_press = function()
			awful.spawn("pactl set-source-mute @DEFAULT_SOURCE@ toggle")
		end,
	}),
	awful.key({
		modifiers = {},
		key = "XF86AudioPlay",
		description = "Toggle media playback",
		group = "Multimedia",
		on_press = function()
			awful.spawn("playerctl play-pause")
		end,
	}),
	awful.key({
		modifiers = {},
		key = "XF86AudioNext",
		description = "Play next media from queue",
		group = "Multimedia",
		on_press = function()
			awful.spawn("playerctl next")
		end,
	}),
	awful.key({
		modifiers = {},
		key = "XF86AudioPrev",
		description = "Play previous media from queue",
		group = "Multimedia",
		on_press = function()
			awful.spawn("playerctl previous")
		end,
	}),
	awful.key({
		modifiers = {},
		key = "XF86AudioStop",
		description = "Stop media",
		group = "Multimedia",
		on_press = function()
			awful.spawn("playerctl stop")
		end,
	}),
	awful.key({
		modifiers = { mod.ctrl },
		key = "XF86AudioNext",
		description = "Seek 10 seconds forward",
		group = "Multimedia",
		on_press = function()
			awful.spawn("playerctl position 10+")
		end,
	}),
	awful.key({
		modifiers = { mod.ctrl },
		key = "XF86AudioPrev",
		description = "Seek 10 seconds backward",
		group = "Multimedia",
		on_press = function()
			awful.spawn("playerctl position 10-")
		end,
	}),
	awful.key({
		modifiers = { mod.super },
		key = "XF86AudioMute",
		description = "Open pavucontrol",
		group = "Multimedia",
		on_press = function()
			awful.spawn("pavucontrol")
		end,
	}),
	awful.key({
		modifiers = {},
		key = "XF86MonBrightnessUp",
		description = "Increases brightness by 1%",
		group = "Display",
		on_press = function()
			awful.spawn("sudo light -A 1")
		end,
	}),
	awful.key({
		modifiers = {},
		key = "XF86MonBrightnessDown",
		description = "Decrease brightness by 1%",
		group = "Display",
		on_press = function()
			awful.spawn("sudo light -U 1")
		end,
	}),

	-- {{{
	-- Application related bindings
	--
	-- Browser
	awful.key({
		modifiers = { mod.super },
		key = "b",
		description = "Opens firefox profile manager",
		group = "Apps",
		on_press = function()
			awful.spawn("firefox --ProfileManager")
		end,
	}),

	-- Communication apps
	awful.key({
		modifiers = { mod.super },
		key = "c",
		description = "Opens menu to open chatting applications",
		group = "Apps",
		on_press = function()
			widgets.menu.chatmenu:show()
		end,
	}),

	-- Screenshot
	awful.key({
		modifiers = { mod.super, mod.shift },
		key = "s",
		description = "Take a screenshot",
		group = "Multimedia",
		on_press = function()
			awful.spawn("flameshot gui")
		end,
	}),

	-- clipboard manager
	awful.key({
		modifiers = { mod.super, mod.shift },
		key = "v",
		description = "Toggles copyq clipboard manager",
		group = "Apps",
		on_press = function()
			awful.spawn("copyq toggle")
		end,
	}),
	-- }}}
})
