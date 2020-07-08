 #!/bin/bash

i3bkeymapfile="${HOME}/.cache/i3b_pid_keymap"
icon=""
i3bpid="$(cat ${i3bkeymapfile})"
i3bpidcur="$(pidof i3blocks)"

if [[ ${i3bpid} == ${i3bpidcur} ]]; then
    xkb-switch -n
else
    echo "${i3bpidcur}" > "${i3bkeymapfile}"
fi

out="$(xkb-switch)"
printf "%s %s\n" "${icon}" "${out}"
