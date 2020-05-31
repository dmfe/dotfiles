#!/bin/bash

choose=$(grep -v "#" ~/.local/share/emoji | \
    dmenu -i -l 20 -fn Monospace-18 | \
    awk '{print $1}')

if [[ -z ${choose} ]]; then
    exit 1
fi

echo "${choose}" | tr -d '\n' | xclip -selection clipboard

pgrep -x dunst > /dev/null && \
notify-send "$(xclip -o -selection clipboard) copied to clipboard"
