#!/usr/bin/bash

STATE=""
BAT="BAT1"
export DISPLAY=:0
# export XAUTHORITY=/run/lightdm/root/:0
export XAUTHORITY=/home/albi/.Xauthority

if [[ "$1" == "BAT" || "$1" == "AC" ]]; then
  STATE="$1"
fi

if [[ $STATE == "" ]]; then
  if [[ $(acpi -a | cut -d' ' -f3) == "on-line" ]]; then
    STATE="AC"
  else STATE="BAT"
  fi
fi

echo $STATE
xrandr --newmode "1920x1080_60.00" 172.80 1920 2040 2248 2576 1080 1081 1084 1118 -HSync +Vsync
xrandr --addmode eDP "1920x1080_60.00"
xrandr --addmode eDP-1-1 "1920x1080_60.00"
xrandr --addmode DP-4 "1920x1080_60.00"
if [[ $STATE == "BAT" ]]; then
  echo "Discharging, set governor to powersave"
  cpupower frequency-set -g powersave
  xrandr --output eDP --mode "1920x1080_60.00"
  xrandr --output eDP-1-1 --mode "1920x1080_60.00"
  xrandr --output DP-4 --mode "1920x1080_60.00"
  echo "Display set to 60hz"
  # sleep 1.5
  # /home/albi/.config/scripts/setbright
elif [[ $STATE == "AC"  ]]; then
  echo "AC plugged in, set governor to performance"
  cpupower frequency-set -g performance
  xrandr --output eDP --mode "1920x1080"
  xrandr --output eDP-1-1 --mode "1920x1080"
  xrandr --output DP-4 --mode "1920x1080"
  echo "Display set to 165hz"
  # sleep 2
  # /home/albi/.config/scripts/setbright
fi
