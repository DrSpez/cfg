-- Desktop
--  main
hl.monitor({
  output = "HDMI-A-2",
  mode = "preferred",
  position = "auto",
  scale = 1.5,
})
--  side
hl.monitor({
  output = "Unknown-2",
  mode = "preferred",
  position = "0x0",
  scale = 1,
  transform = 3, -- vertical
})

-- Laptop
--  main
hl.monitor({
  output = "eDP-1",
  mode = "preferred",
  position = "auto",
  scale = 1,
})
--  hdmi
hl.monitor({
  output = "HDMI-A-1",
  mode = "preferred",
  position = "auto",
  scale = 1,
  mirror = "eDP-1",
})
