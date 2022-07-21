#!/usr/bin/env bash
declare -a themes
cd ~/themes
for i in $(ls -d */)
do
  themes+=($i)
done
themes+=(quit)
length=${#themes[@]}
choice=$(printf '%s\n' "${themes[@]}" | rofi -dmenu -i -l $length -p 'Change theme')
if [[ "$choice" == "quit" ]]; then
  echo "Program terminated." && exit 0
elif [ "$choice" ]; then
  cp ~/.Xresources ~/themes/.Xresources.bak
  cp ~/.gtkrc-2.0 ~/themes/.gtkrc-2.0.bak
  cp ~/.config/gtk-3.0/settings.ini ~/themes/settings.ini.bak 
  cp $choice/.Xresources ~/
  cp $choice/.gtkrc-2.0 ~/
  cp $choice/settings.ini ~/.config/gtk-3.0/
  cursor="$(grep "gtk-cursor-theme-name" $choice/settings.ini | awk -F = '{print $2}')"
  icon_theme="$(grep "gtk-icon-theme-name" $choice/settings.ini | awk -F = '{print $2}')"
  sed -i "s/Inherits=.*/Inherits=${cursor}/" ~/.icons/default/index.theme
  xrdb ~/.Xresources
  ./rofi.sh 1 > ~/.config/rofi/themes/colors.rasi
  ./rofi.sh 2 $icon_theme > ~/.config/rofi/config.rasi
  ./alacrittyfont.sh > ~/.config/alacritty/fonts.yml
  ./alacrittycolors.sh > ~/.config/alacritty/colors.yml
  ./i3lockcolors.sh
  kill -HUP $(pidof dwm)
else
  echo "Program terminated." && exit 0
fi
