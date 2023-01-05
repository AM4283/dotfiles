#!/usr/bin/env bash
config="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-3.0/settings.ini"
if [ ! -f "$config" ]; then exit 1; fi

gnome_schema="org.gnome.desktop.interface"
gtk_theme="$(grep 'gtk-theme-name' "$config" | sed 's/.*\s*=\s*//')"
icon_theme="$(grep 'gtk-icon-theme-name' "$config" | sed 's/.*\s*=\s*//')"
cursor_theme="$(grep 'gtk-cursor-theme-name' "$config" | sed 's/.*\s*=\s*//')"
font_name="$(grep 'gtk-font-name' "$config" | sed 's/.*\s*=\s*//')"!/bin/sh
monospace_font_name="$(grep "\*\.font:" .Xresources | awk -F : '{print $2}' | sed s/" "//)"
monospace_font_size=$(($(grep "\*\.font:" .Xresources | awk -F : '{print $3}' | awk -F = '{print $2}')-5))

gsettings set "$gnome_schema" gtk-theme "$gtk_theme"
gsettings set org.gnome.desktop.wm.preferences theme "$gtk_theme" &
gsettings set org.gnome.desktop.wm.preferences button-layout '' &
gsettings set "$gnome_schema" icon-theme "$icon_theme" &
gsettings set "$gnome_schema" cursor-theme "$cursor_theme" &
gsettings set "$gnome_schema" font-name "$font_name" &
gsettings set "$gnome_schema" monospace-font-name "$monospace_font_name $monospace_font_size" &
gsettings set "$gnome_schema" document-font-name "$font_name" &
gsettings set org.gnome.desktop.wm.preferences titlebar-font "$font_name" &

dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &

killall -q wl-paste
while pgrep -u $UID -x wl-paste >/dev/null; do sleep 1; done

wl-paste -t text --watch clipman store &
wl-paste -p -t text --watch clipman store -P --histpath="~/.local/share/clipman-primary.json" &

# echo "done with paste"

dunst &
# swww kill
# swww init
killall -q swaybg
while pgrep -u $UID -x swaybg >/dev/null; do sleep 1; done
swaybg -i /home/albi/Pictures/backgrounds/carti.png &
# lxpolkit &

killall -q waybar
while pgrep -u $UID -x waybar >/dev/null; do sleep 1; done
waybar &

# echo "done with waybar"

killall -q gammastep
while pgrep -u $UID -x gammastep >/dev/null; do sleep 1; done
gammastep-indicator &

# echo "done with gammastep"
blueman-applet &
lxpokit &
foot --server &

killall -q swayidle
while pgrep -u $UID -x swayidle >/dev/null; do sleep 1; done
swayidle -w \
  timeout 600 "notify-send -u critical -t -1 'Locking Screen in 30 Seconds'" \
  timeout 630 "waylock --init-color '#000000' --input-color '#789FF2'" \
  timeout 900 "systemctl suspend"
