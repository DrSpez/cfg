-- Scratchpad default floating and of fixed size
hl.window_rule({
  name = "center-on-scratchpad",
  match = { workspace = "special:scratchpad" },
  float = true,
  center = true,
  size = { "(monitor_w*0.8)", "(monitor_h*0.9)" },
})
