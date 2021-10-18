#!/bin/sh
if [ "$(pidof xidlehook)" ]
then
  PID=$(pidof xidlehook)
  kill "$PID" > /dev/null
  /home/albi/.config/scripts/locker
else
  /home/albi/.config/scripts/locker
fi &

if [ "$(pidof dwmblocks)" ]
then
#  PID=$(pidof dwmblocks)
#  kill "$PID"
  pkill dwmblocks
  dwmblocks
else
  sleep 0.5
  dwmblocks
fi &

#xset s off && xset -dpms &
# xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" 1 &
# setxkbmap -option ctrl:nocaps &
setxkbmap -option caps:escape &
xrdb -merge ~/.Xresources &
#xmodmap ~/.Xmodmap &
#setxkbmap -option lv3:rwin_switch &
lxpolkit &
dunst &
parcellite -n &
#ntfd &
#nm-applet &
picom -f &
#setbrightness &
feh --bg-fill /home/albi/Pictures/backgrounds/girlsunset.jpg
#/home/albi/.config/scripts/locker &
#/home/albi/.config/polybar/launch.sh
