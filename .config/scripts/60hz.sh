xrandr --newmode "1920x1080_60.00" 172.80 1920 2040 2248 2576 1080 1081 1084 1118 -HSync +Vsync
xrandr --addmode eDP "1920x1080_60.00"
xrandr --addmode eDP-1-1 "1920x1080_60.00"
xrandr --addmode DP-4 "1920x1080_60.00"
xrandr --output eDP --mode "1920x1080_60.00"
xrandr --output eDP-1-1 --mode "1920x1080_60.00"
xrandr --output DP-4 --mode "1920x1080_60.00"
echo "Display set to 60hz"
