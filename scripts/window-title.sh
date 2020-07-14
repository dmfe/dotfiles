#!/bin/bash

max_width=50
text="$(sleep .3; xdotool getactivewindow getwindowname)"
short_text="${text:0:$((max_width-3))}..."

tilte_len=$((${#text}))
if ((${#text} > $max_width)); then
    text="${short_text}"
fi

echo "${text}"

