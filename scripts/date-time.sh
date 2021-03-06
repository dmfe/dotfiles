#!/bin/bash

case ${BLOCK_BUTTON} in
    1)
        nohup "${TERMINAL}" -e sh -c 'cal -3; read' >/dev/null &
        ;;
    2)
        nohup "${TERMINAL}" -e "${EDITOR}" "$0" >/dev/null &
        ;;
esac

icon=""
val="$(date '+%a %b %d %H:%M %Y')"

printf "%s %s\n" "${icon}" "${val}"
