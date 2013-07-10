require('awful')

globalkeys = awful.util.table.join(globalkeys,
  --lock screen on meta+pause
  awful.key({ modkey }, "=", function () awful.util.spawn(lock_cmd) end)
)
