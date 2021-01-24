#!/usr/bin/env bash

shopt -s nullglob globstar

typeit=0
if [[ $1 == "--type" ]]; then
    typeit=1
    shift
fi

prefix=${PASSWORD_STORE_DIR-~/.password-store}
password_files=( "${prefix}"/**/*.gpg )
password_files=( "${password_files[@]#"$prefix"/}" )
password_files=( "${password_files[@]%.gpg}" )

panel_background=$(xrdb -query | grep '*.panel_background' | awk '{print $NF}')
selected_background=$(xrdb -query | grep '*.ws_focused' | awk '{print $NF}')

password=$(printf '%s\n' "${password_files[@]}" | dmenu -fn Monospace-18 -nb "${panel_background}" -sb "${selected_background}" "$@")

[[ -n $password ]] || exit

if [[ $typeit -eq 0 ]]; then
    pass show -c "${password}" 2>/dev/null && \
        notify-send "${password} copied to clipboard"
else
    pass show "${password}" | { IFS= read -r pass; printf %s "$pass"; } |
        xdotool type --clearmodifiers --file -
fi

