local awful = require('awful')

-- LAYOUTS
layouts = {
  awful.layout.suit.floating,             -- 1
  awful.layout.suit.tile,                 -- 2
  -- awful.layout.suit.tile.left,
  awful.layout.suit.tile.bottom,          -- 3
  --. awful.layout.suit.tile.top,
  awful.layout.suit.fair,                 -- 4
  -- awful.layout.suit.fair.horizontal,
  -- awful.layout.suit.spiral,
  -- awful.layout.suit.spiral.dwindle,
  awful.layout.suit.max,                  -- 5
  -- awful.layout.suit.max.fullscreen,
  -- awful.layout.suit.magnifier
}

-- TAGS (aka screens)
tags = {}
tags = {
  names  = { "term", "www", "code", "daemons", "5", "misc", "7", "8", "root" },
  layout = { layouts[2], layouts[2], layouts[4], layouts[2], layouts[2], layouts[2], layouts[2], layouts[2], layouts[3] }
}
for s = 1, screen.count() do
  tags[s] = awful.tag(tags.names, s, tags.layout)
end
