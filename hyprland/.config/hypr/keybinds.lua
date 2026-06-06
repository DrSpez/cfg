-- mod keys
local mainMod = "ALT"
local subMod = "WIN"

-- commands
local terminal = "ghostty"
local menu =
  "pgrep -x rofi >/dev/null 2>&1 && killall rofi || rofi -show combi -combi-modi 'drun,run' -show-icons -display-combi \">\" -combi-display-format '{mode}: {text}'" -- NOTE: requires rofi-wayland; toggles
local browser = "firefox"
local fileManager = "ghostty -e lf"
local lockScreen = "hyprlock"
local screenshotSection = 'grim -g "$(slurp)" - | wl-copy'
local screenshotFullscreen = "grim -o $(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name') - | wl-copy"
local colorPicker = "hyprpicker -a" -- NOTE: requires wl-clipboard to copy on click
local fullReload = "hyprctl reload; killall -SIGUSR2 waybar"
local exitHyprland = "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"

-- Main binds
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo({ action = "toggle" }))
hl.bind(mainMod .. " + Slash", hl.dsp.layout("rotatesplit +90"))
hl.bind(mainMod .. " + m", hl.dsp.group.toggle())
hl.bind(mainMod .. " + Comma", hl.dsp.group.prev())
hl.bind(mainMod .. " + Period", hl.dsp.group.next())
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("scratchpad"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:scratchpad" }))
-- Move focus
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))
-- Swap active window
hl.bind(mainMod .. " + SHIFT + h", hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.swap({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + k", hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + j", hl.dsp.window.swap({ direction = "down" }))
-- Commands
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(colorPicker))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(screenshotSection))
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd(screenshotFullscreen))
-- System commands
hl.bind(subMod .. " + L", hl.dsp.exec_cmd(lockScreen))
hl.bind(subMod .. " + R", hl.dsp.exec_cmd(fullReload))
hl.bind(subMod .. " + M", hl.dsp.exec_cmd(exitHyprland))

-- Workspaces
for i = 1, 10 do
  local key = i % 10 -- 10 maps to key 0
  -- switch workspace
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  -- move active window to workspace
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- # Move workspace to next monitor
hl.bind(mainMod .. " + SHIFT + TAB", hl.dsp.workspace.move({ monitor = "+1" }))

-- # Scroll through existing workspaces with subMod + scroll
hl.bind(subMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(subMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Drag/resize window
hl.bind(subMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(subMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- laptop multimedia keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
-- Requires playerctl
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 5%+"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"))
