# Set up monitors
xrandr --output USB-C-0 --mode 1920x1080 --rotate right
xrandr --output HDMI-0 --primary --scale 0.75

# Launch i3 window manager
exec i3
