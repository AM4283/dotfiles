#!/usr/bin/env bash
# xrdb_grep() {
#     xrdb -query | grep "$1" | cut -f 2 | head -1
# }
xrdb_grep() {
  grep "^\*\.$1:" ~/.Xresources  | cut -d':' -f2- | sed s/" "//
}
textcolor="'$(xrdb_grep 'rofifg')E6'"
sed -i "s/^D=.*/D=$textcolor  # default/" "${XDG_CONFIG_HOME}/scripts/lock"
sed -i "s/^T=.*/T=$textcolor  # text/" "${XDG_CONFIG_HOME}/scripts/lock"
