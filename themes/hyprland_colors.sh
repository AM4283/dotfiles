#!/usr/bin/env bash

xrdb_grep() {
  grep "^\*\.$1:" ~/.Xresources  | cut -d':' -f2- | sed s/" "//
}

active_border_gradient1="$(xrdb_grep bar_wsunderline | sed s/#//)"
active_border_gradient2="$(xrdb_grep bar_statusunderline | sed s/#//)"
inactive_border="$(xrdb_grep normbordercolor | sed s/#//)"

# echo $active_border_gradient1 $active_border_gradient2
sed -i "s/    col.active_border = .*/    col.active_border = rgba(${active_border_gradient1}ee) rgba(${active_border_gradient2}ee) 45deg/" "$XDG_CONFIG_HOME"/hypr/hyprland.conf 
sed -i "s/    col.inactive_border = .*/    col.inactive_border = rgba(${inactive_border}aa)/" "$XDG_CONFIG_HOME"/hypr/hyprland.conf
