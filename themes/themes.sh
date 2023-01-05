#!/usr/bin/env bash
declare -a themes
cd ~/themes || exit 1
for i in *;
do
  if [ -d "$i" ]; then
    themes+=("$i")
  fi
done
themes+=(quit)
length=${#themes[@]}
choice=$(printf '%s\n' "${themes[@]}" | rofi -dmenu -i -l "$length" -p 'Change theme')

gtk2notinhome=false
if [[ -n $GTK2_RC_FILES ]]; then
  gtk2notinhome=true
  # echo "true"
else
  gtk2notinhome=false
  # echo "false"
fi

if [[ "$choice" == "quit" ]]; then
  echo "Program terminated." && exit 0
elif [ "$choice" ]; then
  cp ~/.Xresources ~/themes/.Xresources.bak
  cp ~/.config/gtk-3.0/settings.ini ~/themes/settings.ini.bak 
  cp "$choice"/.Xresources ~/
  if [ $gtk2notinhome == true ]; then
    cp "$GTK2_RC_FILES" ~/themes/gtkrc.bak
    cp "$choice"/.gtkrc-2.0 "$GTK2_RC_FILES"
  else
    cp ~/.gtkrc-2.0 ~/themes/.gtkrc-2.0.bak
    cp "$choice"/.gtkrc-2.0 ~/
  fi
  cp "$choice"/settings.ini ~/.config/gtk-3.0/
  cursor="$(grep "gtk-cursor-theme-name" "$choice"/settings.ini | awk -F = '{print $2}')"
  icon_theme="$(grep "gtk-icon-theme-name" "$choice"/settings.ini | awk -F = '{print $2}')"
  gtk_theme="$(grep "gtk-theme-name" "$choice"/settings.ini | awk -F = '{print $2}')"
  sed -i "s/Inherits=.*/Inherits=${cursor}/" ~/.icons/default/index.theme
  sed -i "s/Inherits=.*/Inherits=${cursor}/" ~/.local/share/icons/default/index.theme
  # sed -i "s/export GTK_THEME=.*/export GTK_THEME=${gtk_theme}/" ~/.profile
  sed -i "s/export XCURSOR_THEME=.*/export XCURSOR_THEME=${cursor}/" ~/.profile
  hyprctl setcursor "$cursor" "$XCURSOR_SIZE"
  xrdb ~/.Xresources
  ./rofi.sh 1 > ~/.config/rofi/themes/colors.rasi
  ./rofi.sh 2 "$icon_theme" > ~/.config/rofi/config.rasi
  ./alacrittyfont.sh > ~/.config/alacritty/fonts.yml
  ./alacrittycolors.sh > ~/.config/alacritty/colors.yml
  ./footcolors.sh > ~/.config/foot/colors.ini
  ./waybarcolors.sh > ~/.config/waybar/colors.css
  ./i3lockcolors.sh
  kill -HUP "$(pidof dwm)"
  kill "$(pidof foot)"
  hyprctl reload
else
  echo "Program terminated." && exit 0
fi
