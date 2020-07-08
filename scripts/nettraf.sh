#!/bin/bash

logfile="${HOME}/.cache/netlog"
prevdata="$(cat ${logfile})"

rxcur="$(($(cat /sys/class/net/*/statistics/rx_bytes | paste -sd '+')))"
txcur="$(($(cat /sys/class/net/*/statistics/tx_bytes | paste -sd '+')))"
rx="$(((rxcur-${prevdata%% *})/1024))"
tx="$(((txcur-${prevdata##* })/1024))"

echo "${rxcur} ${txcur}" > "${logfile}"

printf "%sKiB%sKiB\n" "${rx}" "${tx}"
