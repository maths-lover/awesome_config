local naughty = require("naughty")

-- {{{ Error handling
-- handle errors during startup
naughty.connect_signal("request::display_error", function(message, startup)
	naughty.notification({
		urgency = "critical",
		title = "Oops, and error happened" .. (startup and " during startup!" or "!"),
		message = message,
	})
end)

-- Handle runtime errors after startup
do
	local in_error = false
	awesome.connect_signal("debug::error", function(err)
		-- Make sure we don't go into an endless error loop
		if in_error then
			return
		end
		in_error = true

		naughty.notify({
			preset = naughty.config.presets.critical,
			title = "Oops, an error happened!",
			text = tostring(err),
		})
		in_error = false
	end)
end
-- }}}

naughty.connect_signal("request::display", function(n)
	naughty.layout.box({ notification = n })
end)
