#!/bin/bash

icons_dir=Pictures/Icons
icon_file="$(ls $icons_dir | sort -R | head -n 1)"
icon=$HOME/$icons_dir/$icon_file
tmp_bg=/tmp/screen.png

[[ -f "${tmp_bg}" ]] && rm -f "${tmp_bg}"

#echo $icon

scrot $tmp_bg
convert $tmp_bg -scale 10% -scale 1000% $tmp_bg
convert $tmp_bg $icon -gravity center -composite -matte $tmp_bg
i3lock -u -i $tmp_bg
