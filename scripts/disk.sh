#!/bin/bash

location=${1:-/}

[[ -d ${location} ]] || exit

case ${BLOCK_BUTTON} in
    1)
        notify-send "Disk space" "$(df -h --output=target,used,size)"
        ;;
    2)
        nohup "${TERMINAL}" -e "${EDITOR}" "$0" >/dev/null &
        ;;
esac

case ${location} in
    "/home"* )
        icon=""
        ;;
    "/mnt"* )
        icon=""
        ;;
    *)
        icon=""
        ;;
esac

printf "%s %s\n" "${icon}" "$(df -h ${location} | awk ' /[0-9]/ {print $3 "/" $2}')"

