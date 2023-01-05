#!/usr/bin/env bash
# Generates an alacritty color config from currently loaded X resources.

# xrdb_grep() {
#     # xrdb -query | grep -E '^\*'"$1"':'
#     xrdb -query | grep "$1" | cut -f 2 | head -1
# }

xrdb_grep() {
  grep "^\*\.$1:" ~/.Xresources  | cut -d':' -f2- | sed s/" "//
}

readonly color_idx=(black red green yellow blue magenta cyan white)

# Begin to print alacritty config.
printf 'colors:\n'
printf '  primary:\n'
printf '    background:\t%s\n' "'$(xrdb_grep 'background')'"
printf '    foreground:\t%s\n' "'$(xrdb_grep 'foreground')'"
printf '  cursor:\n'
printf '    cursor:\t%s\n' "'$(xrdb_grep 'cursor')'"
printf '  normal:\n'
num=0
index=0
for i in "${color_idx[@]}"
do
  printf '    %s:\t\047%s\047\n' "${color_idx[$num]}" "$(xrdb_grep 'color'$index)"
  num=$((num+1))
  index=$((index+1))
done
printf '  bright:\n'
num=0
for i in "${color_idx[@]}"
do
  printf '    %s:\t\047%s\047\n' "${color_idx[$num]}" "$(xrdb_grep 'color'$index)"
  num=$((num+1))
  index=$((index+1))
done
# printf 'background_opacity:\t%s\n' $(xrdb_grep 'alpha')
printf 'window:\n'
printf '  opacity:\t%s\n' "$(xrdb_grep 'alpha')"
