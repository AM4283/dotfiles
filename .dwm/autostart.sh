#!/bin/sh
if [ "$(pidof xidlehook)" ]
then
  PID=$(pidof xidlehook)
  kill "$PID" > /dev/null
  $HOME/.config/scripts/locker
else
  $HOME/.config/scripts/locker
fi &

# if [ "$(pidof dwmblocks)" ]
# then
# #  PID=$(pidof dwmblocks)
# #  kill "$PID"
#   pkill dwmblocks
#   dwmblocks
# else
#   # sleep 0.5
#   sleep 1
#   dwmblocks
# fi &

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
thunar --daemon &
feh --no-fehbg --bg-fill $HOME/Pictures/backgrounds/hollow-knight-shadow-bg.png
#$HOME/.config/scripts/locker &
#$HOME/.config/polybar/launch.sh
