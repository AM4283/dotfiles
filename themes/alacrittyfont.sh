#!/usr/bin/env bash
# Generates an alacritty font config from currently loaded X resources.
xrdb_grep() {
    # xrdb -query | grep -E '^\*'"$1"':'
    xrdb -query | grep "$1" | cut -f 2 | head -1
}
# Begin to print alacritty config.
font=$(xrdb_grep '^*.font')
fontsize=$(echo "$font" | awk -F : '{print $2}' | awk -F = '{print $2}')
fontsize=$((fontsize - 5))
font=${font%%:*}
font=\"$font\"
# echo $font
printf 'font:\n'
printf '  normal:\n'
printf '    family:\t%s\n' "$font"
printf '    style:\tRegular\n'
printf '  bold:\n'
printf '    family:\t%s\n' "$font"
printf '    style:\tBold\n'
printf '  italic:\n'
printf '    family:\t%s\n' "$font"
printf '    style:\tItalic\n'
printf '  bold_italic:\n'
printf '    family:\t%s\n' "$font"
printf '    style:\tBold Italic\n'
printf '  size:\t%s\n' "$fontsize.0"
# printf '  offset:\n'
# printf '    x: 0\n'
# printf '    y: 0\n'
# printf '  glyph_offset:\n'
# printf '    x: 0\n'
# printf '    y: 0\n'
printf 'draw_bold_text_with_bright_colors: true\n'
