#!/bin/bash

#Pass the password to the block instance
[[ -n $BLOCK_INSTANCE ]] && \
    password=("-h" "${BLOCK_INSTANCE}@localhost")

filter() {
    tr '\n' ' ' | grep -Po '.*(?= \[playing\])|paused' | tr -d '\n'
}

icon=""

case $BLOCK_BUTTON in
    1)
        out=$(mpc $password status | filter)
        nohup "${TERMINAL}" -e ncmpcpp >/dev/null &
        ;; # left click run ncmpcpp
    3)
        out=$(mpc $password toggle | filter)
        ;; # right click, pause/unpause
    4)
        out=$(mpc $password prev | filter)
        ;; # scroll up, previous
    5)
        out=$(mpc $password next | filter)
        ;; # scroll down, next
    *)
        out=$(mpc $password status | filter)
        ;;
esac

[[ -n ${out} ]] && \
    printf "%s %s\n" "${icon}" "${out}"
