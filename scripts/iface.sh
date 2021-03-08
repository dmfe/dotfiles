#!/bin/bash

icon=
iface=$(ip route | awk '/^default via/ { print $5 ; exit }')

[[ ! -d /sys/class/net/${iface} ]] && exit

if [[ "$(cat /sys/class/net/$iface/operstate)" = 'down' ]]; then
  printf '<span foreground="#ff0000">%s</span>' "${icon} down"
  exit
fi

case $1 in
  -4)
    af=inet ;;
  -6)
    af=inet6 ;;
  *)
    af=inet6? ;;
esac

ipaddr=$(ip addr show enp3s0 | awk '/inet/ { print $2 ; exit }' | sed 's/\/.*//g')

echo "${icon} ${ipaddr}"
echo
echo "#66ff33"
echo
