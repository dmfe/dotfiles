#!/bin/bash

panel_backgroud=$(xrdb -query | grep '*.panel_background' | awk '{print $NF}')
focused_background=$(xrdb -query | grep '*.ws_focused' | awk '{print $NF}')
text=$(xrdb -query | grep '*.text_color' | awk '{print $NF}')

i=0
while IFS= read -r input; do
    if (( $i == 0 )); then
        value="${input}"
    fi
    if (( $i == 1 )); then
        foreground="${input}"
    fi
    if (( $i == 2 )); then
        background="${input}"
    fi

    i=$(( $i + 1 ))
done

while getopts "sr" opt; do
    case ${opt} in
        s)
            separator="yes"
            ;;
        r)
            reversed="yes"
            ;;
        \?)
            echo "Invalid option"
            exit 1
            ;;
    esac
done

if [[ -z ${separator} ]]; then
    if [[ -z ${reversed} ]]; then
        foreground=${foreground:-${text}}
        background=${background:-${panel_backgroud}}
    else
        foreground=${foreground:-${text}}
        background=${background:-${focused_background}}
    fi
else
    if [[ -z ${reversed} ]]; then
        foreground=${foreground:-${focused_background}}
        background=${background:-${panel_backgroud}}
    else
        foreground=${foreground:-${panel_backgroud}}
        background=${background:-${focused_background}}
    fi
fi

echo "${value}"
echo ""
echo "${foreground}"
echo "${background}"

