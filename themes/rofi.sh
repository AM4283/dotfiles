#!/usr/bin/env bash
xrdb_grep() {
    xrdb -query | grep "$1" | cut -f 2 | head -1
}

# color_from_line() {
#     read -r line && readonly line
#     echo "${line/\#/0x}" | tr -d '[:space:]' | cut -d ':' -f 2
# }
case $1 in
  1)
    printf '* {\n'
    printf '    shl: %s4D;\n' "$(xrdb_grep 'rofiselbg')"
    printf '    bg: %sCC;\n' "$(xrdb_grep 'rofibg')"
    printf '    fg: %s;\n' "$(xrdb_grep 'rofifg')"
    printf '    ufg: %s;\n' "$(xrdb_grep 'rofiurgentfg')"
    printf '    sc: %s;\n' "$(xrdb_grep 'rofiseparatorcolor')"
    printf '    afg: %s;\n' "$(xrdb_grep 'rofiactivefg')"
    printf '}'
    ;;
  2)
    font=$(xrdb_grep '^*.font')
    fontsize=$(echo $font | awk -F : '{print $2}' | awk -F = '{print $2}')
    fontsize=$((fontsize - 5))
    font=${font%%:*}
    # font=\"$font\"
    printf 'configuration {\n'
    printf '    font:\t"%s Semibold %s";\n' "$font" "$fontsize"
    printf '    icon-theme:\t"%s";\n' "$2"
    printf '    show-icons:\ttrue;\n'
    printf '}\n'
    printf '@theme "semitransparent"'
esac
