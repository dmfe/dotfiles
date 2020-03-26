#!/bin/sh

mem_info() {
    ps_out="$(ps axch -o cmd:15,pid,%mem --sort -%mem | head)"

    IFS=$(echo -en "\n\b")
    fmt_msg=""
    num=1
    for row in ${ps_out[@]}; do
        name="$(echo -e $row | awk '{NF-=2; print $OFS}')"
        pid="$(echo -e $row | awk '{NF-=1; print $NF}')"
        mem="$(echo -e $row | awk '{print $NF}')"
        fmt_msg=${fmt_msg}$(printf "%s\t%s|%s|%s" "$num" "$name" "$pid" "$mem%")"\n"
        num=$(( $num + 1 ))
    done

    fmt_msg=$(echo -e "${fmt_msg}" | column -s "|" -t -o " > ")
    echo "${fmt_msg}"
}

case $BLOCK_BUTTON in
    1) notify-send "Top 10 memory consumption" "$(mem_info)" -t 30000;;
esac

free -h | awk '/^Mem:/ {print $3 "/" $2}' | sed 's/i//g'
