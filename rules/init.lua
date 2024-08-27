local awful = require("awful")
local ruled = require("ruled")

ruled.client.connect_signal("request::rules", function()
	-- All clients will match this rule.
	ruled.client.append_rule({
		id = "global",
		rule = {},
		properties = {
			focus = awful.client.focus.filter,
			raise = true,
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap + awful.placement.no_offscreen,
		},
	})

	-- Floating clients.
	ruled.client.append_rule({
		id = "floating",
		rule_any = {
			instance = { "copyq", "pinentry" },
			class = {
				"Arandr",
				"Blueman-manager",
				"Gpick",
				"Kruler",
				"Sxiv",
				"Tor Browser",
				"Wpa_gui",
				"veromix",
				"xtightvncviewer",
			},
			-- Note that the name property shown in xprop might be set slightly after creation of the client
			-- and the name shown there might not match defined rules here.
			name = {
				"Event Tester", -- xev.
			},
			role = {
				"AlarmWindow", -- Thunderbird's calendar.
				"ConfigManager", -- Thunderbird's about:config.
				"pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
			},
		},
		properties = { floating = true },
	})

	-- Add titlebars to normal clients and dialogs
	ruled.client.append_rule({
		id = "titlebars",
		rule_any = { type = { "normal", "dialog" } },
		properties = { titlebars_enabled = true },
	})

	-- Order matters for following
	ruled.client.append_rule({
		rule = { class = "org.wezfurlong.wezterm" },
		properties = { tag = "1", switchtotag = true },
	})
	ruled.client.append_rule({
		rule = { class = "Firefox" },
		properties = { tag = "2" },
	})
	ruled.client.append_rule({
		rule = { class = "Brave-browser" },
		properties = { tag = "2" },
	})
	ruled.client.append_rule({
		rule = { class = "neovide" },
		properties = { tag = "4", switchtotag = true },
	})
	ruled.client.append_rule({
		rule = { class = "obs" },
		properties = { tag = "6", switchtotag = true },
	})
	ruled.client.append_rule({
		rule = { class = "obsidian" },
		properties = { tag = "5", switchtotag = true },
	})
	ruled.client.append_rule({
		rule = { class = "Spotify" },
		properties = { tag = "7" },
	})
	ruled.client.append_rule({
		rule = { class = "zoom" },
		properties = { tag = "8" },
	})
	ruled.client.append_rule({
		rule = { class = "Slack" },
		properties = { tag = "9" },
	})
	ruled.client.append_rule({
		rule = { class = "TelegramDesktop" },
		properties = { tag = "9" },
	})
end)
