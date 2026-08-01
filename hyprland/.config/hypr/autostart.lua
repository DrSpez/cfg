hl.on("hyprland.start", function()
  -- Essentials
  hl.exec_cmd("pgrep -x waybar >/dev/null 2>&1 && killall waybar || waybar")
  hl.exec_cmd("hyprsunset")
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("hypridle")
  -- Secrets
  hl.exec_cmd("gnome-keyring-daemon --start --components=secrets,ssh")
end)
