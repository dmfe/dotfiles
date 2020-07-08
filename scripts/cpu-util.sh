#!/bin/bash

case ${BLOCK_BUTTON} in
    2)
        nohup "${TERMINAL}" -e "${EDITOR}" "$0" >/dev/null &
        ;;
esac

logfile="${HOME}/.cache/cpulog"
prevdata="$(cat ${logfile})"
curdata="$(grep 'cpu ' /proc/stat | awk '{print $2" "$4" "$5}')"

puser="$(echo ${prevdata} | cut -d' ' -f1)"
psystem="$(echo ${prevdata} | cut -d' ' -f2)"
pidle="$(echo ${prevdata} | cut -d' ' -f3)"

cuser="$(echo ${curdata} | cut -d' ' -f1)"
csystem="$(echo ${curdata} | cut -d' ' -f2)"
cidle="$(echo ${curdata} | cut -d' ' -f3)"

work="$(((cuser+csystem)-(puser+psystem)))"
idle="$((cidle-pidle))"

cpu="$((100*work/(work+idle)))"

echo "${curdata}" > "${logfile}"

icon=""

printf "%s %.f%%\n" "${icon}" "${cpu}"
