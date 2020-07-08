#!/bin/sh

case $BLOCK_BUTTON in
    2)
        nohup "${TERMINAL}" -e "${EDITOR}" "$0" >/dev/null &
        ;;
esac

temp="$(sensors | awk '/^k10temp/ {getline; getline; print $2}')"
icon=""

printf "%s %s\n" "${icon}" "${temp}"
