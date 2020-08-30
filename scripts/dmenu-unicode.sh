#!/bin/bash

panel_background=$(xrdb -query | grep '*.panel_background' | awk '{print $NF}')
choose=$(grep -v "#" ~/.local/share/emoji | \
    dmenu -i -l 20 -fn Monospace-18 -nb ${panel_background} | \
    awk '{print $1}')

if [[ -z ${choose} ]]; then
    exit 1
fi

echo "${choose}" | tr -d '\n' | xclip -selection clipboard

pgrep -x dunst > /dev/null && \
notify-send "$(xclip -o -selection clipboard) copied to clipboard"
