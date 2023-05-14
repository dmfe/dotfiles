 #!/bin/bash

i3bkeymapfile="${HOME}/.cache/i3b_pid_keymap"
icon=""
i3bpid="$(cat ${i3bkeymapfile})"
i3bpidcur="$(pidof i3blocks)"

if [[ ${i3bpid} == ${i3bpidcur} ]]; then
    cur_layout="$(setxkbmap -query | grep layout | awk '{print $2}')"
    if [[ $cur_layout == "us" ]]; then
        setxkbmap ru
    else
        setxkbmap us
    fi
else
    echo "${i3bpidcur}" > "${i3bkeymapfile}"
fi

out="$(setxkbmap -query | grep layout | awk '{print $2}')"
printf "%s %s\n" "${icon}" "${out}"
