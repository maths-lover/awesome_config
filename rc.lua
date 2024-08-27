-- awesome_mode: api-level=4:screen=on

-- load luarocks if installed
pcall(require, "luarocks.loader")

-- Error handling
require("errors")

-- load theme
local beautiful = require("beautiful")
local gears = require("gears")
beautiful.init(gears.filesystem.get_themes_dir() .. "sky/theme.lua")

-- load key and mouse bindings
require("bindings")

-- load rules
require("rules")

-- load signals
require("signals")
