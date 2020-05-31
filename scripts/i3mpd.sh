#!/bin/bash

#Pass the password to the block instance
if [[ -n $BLOCK_INSTANCE ]]; then
    password=("-h" "${BLOCK_INSTANCE}@localhost")
fi

filter() {
    tr '\n' ' ' | grep -Po '.*(?= \[playing\])|paused' | tr -d '\n'
}

case $BLOCK_BUTTON in
    1) mpc $password status | filter && $TERMINAL -e ncmpcpp & disown ;; # right click pause/unpause
    3) mpc $password toggle | filter ;; # right click, pause/unpause
    4) mpc $password prev   | filter ;; # scroll up, previous
    5) mpc $password next   | filter ;; # scroll down, next
    *) mpc $password status | filter ;;
esac
