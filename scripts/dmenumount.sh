#!/bin/bash

font="Monospace-18"
panel_background=$(xrdb -query | grep '*.normbgcolor' | awk '{print $NF}')
selected_background=$(xrdb -query | grep '*.selbgcolor' | awk '{print $NF}')

pgrep -x dmenu && exit

mountable=$(lsblk -lp | grep "part $" | awk '{print $1, "(" $4 ")"}')
[[ "${mountable}" = "" ]] && exit 1
chosen=$(echo "${mountable}" | dmenu -fn "${font}" -nb "${panel_background}" -sb "${selected_background}" -i -p "Mount which drive?" | awk '{print $1}')
[[ "${chosen}" = "" ]] && exit 1
mount "${chosen}" > /dev/null 2>&1 && notify-send "${chosen} mounted based on fstab" && exit 0
dirs=$(find /mnt /media /home -type d -maxdepth 3 2>/dev/null)
mountpoint=$(echo "${dirs}" | dmenu -fn "${font}" -nb "${panel_background}" -sb "${selected_background}" -i -p "Type in mount point.")
[[ "${mountpoint}" = "" ]] && exit 1
if [[ ! -d "${mountpoint}" ]]; then
  mkdiryn=$(echo -e "Yes\nNo" | dmenu -fn "${font}" -nb "${panel_background}" -sb "${selected_background}" -i -p "${mountpoint} does not exist. Create it?")
  [[ "${mkdiryn}" = Yes ]] && sudo mkdir -p "${mountpoint}"
fi
sudo mount $chosen $mountpoint -o uid="$(id -u `whoami`)",gid="$(id -g `whoami`)" && \
notify-send "${chosen} mounted to ${mountpoint}"
