-- AWESOME CONFIG

-- Standard awesome library
require('awful')
require('awful.autofocus')
require('awful.rules')
-- Theme handling library
require('beautiful')
-- Notification library
require('naughty')
-- Widget and layout library
require('wibox')

-- Load Debian menu entries
require("debian.menu")

-- VARIABLES
terminal = "urxvt"
editor = "vim"
editor_cmd = terminal .. "-e " .. editor
confdir = os.getenv("HOME") .. "/.awesome/"

-- Default modkey (Mod4 = WinKey)
modkey = "Mod4"

-- THEME
-- default theme
beautiful.init("/usr/share/awesome/themes/default/theme.lua")

-- KEYBINDED COMMANDS (see settings/custom_binds.lua)
lock_cmd = "i3lock --color 000000"

-- TAGS (screens) && LAYOUTS
dofile(confdir .. "settings/tags.lua")

-- Default wibox stuff
dofile(confdir .. 'defaults/wibox.lua')

-- Key && mouse bindings
dofile(confdir .. "defaults/bindings.lua")
dofile(confdir .. "settings/bindings.lua")

root.keys(globalkeys)
