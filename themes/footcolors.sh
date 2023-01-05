#!/usr/bin/env bash
xrdb_grep() {
  grep "^\*\.$1:" ~/.Xresources  | cut -d':' -f2- | sed s/" "//
}

font=$(xrdb_grep 'font')
fontsize=$(echo "$font" | awk -F : '{print $2}' | awk -F = '{print $2}')
fontsize=$((fontsize-5))
font=${font%%:*}

printf 'font=%s%s%s\n\n' "$font" ":size=" "$fontsize"
printf '[colors]\n'
printf 'alpha=%s\n\n' "$(xrdb_grep 'alpha')"
printf 'background = %s\n' "$(xrdb_grep 'background' | sed s/#//)"
printf 'foreground = %s\n\n' "$(xrdb_grep 'foreground' | sed s/#//)"
printf 'regular0 = %s\n' "$(xrdb_grep 'color0' | sed s/#//)"
printf 'regular1 = %s\n' "$(xrdb_grep 'color1' | sed s/#//)"
printf 'regular2 = %s\n' "$(xrdb_grep 'color2' | sed s/#//)"
printf 'regular3 = %s\n' "$(xrdb_grep 'color3' | sed s/#//)"
printf 'regular4 = %s\n' "$(xrdb_grep 'color4' | sed s/#//)"
printf 'regular5 = %s\n' "$(xrdb_grep 'color5' | sed s/#//)"
printf 'regular6 = %s\n' "$(xrdb_grep 'color6' | sed s/#//)"
printf 'regular7 = %s\n\n' "$(xrdb_grep 'color7' | sed s/#//)"
printf 'bright0 = %s\n' "$(xrdb_grep 'color8' | sed s/#//)"
printf 'bright1 = %s\n' "$(xrdb_grep 'color9' | sed s/#//)"
printf 'bright2 = %s\n' "$(xrdb_grep 'color10' | sed s/#//)"
printf 'bright3 = %s\n' "$(xrdb_grep 'color11' | sed s/#//)"
printf 'bright4 = %s\n' "$(xrdb_grep 'color12' | sed s/#//)"
printf 'bright5 = %s\n' "$(xrdb_grep 'color13' | sed s/#//)"
printf 'bright6 = %s\n' "$(xrdb_grep 'color14' | sed s/#//)"
printf 'bright7 = %s\n\n' "$(xrdb_grep 'color15' | sed s/#//)"
printf 'dim0 = %s\n' "$(xrdb_grep 'color0' | sed s/#//)"
printf 'dim1 = %s\n' "$(xrdb_grep 'color1' | sed s/#//)"
printf 'dim2 = %s\n' "$(xrdb_grep 'color2' | sed s/#//)"
printf 'dim3 = %s\n' "$(xrdb_grep 'color3' | sed s/#//)"
printf 'dim4 = %s\n' "$(xrdb_grep 'color4' | sed s/#//)"
printf 'dim5 = %s\n' "$(xrdb_grep 'color5' | sed s/#//)"
printf 'dim6 = %s\n' "$(xrdb_grep 'color6' | sed s/#//)"
printf 'dim7 = %s\n' "$(xrdb_grep 'color7' | sed s/#//)"
