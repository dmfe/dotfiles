#!/bin/bash

font="Monospace-18"
panel_background=$(xrdb -query | grep '*.panel_background' | awk '{print $NF}')
selected_background=$(xrdb -query | grep '*.ws_focused' | awk '{print $NF}')

pgrep -x dmenu && exit

chosen=$(echo -e "Shutdown\nReboot" | dmenu -fn "${font}" -nb "${panel_background}" -sb "${selected_background}" -i -p "What would you like to do?")
if [[ "${chosen}" = Shutdown ]]; then
    yesno=$(echo -e "Yes\nNo" | dmenu -fn "${font}" -nb "${panel_background}" -sb "${selected_background}" -i -p "Do you really want to shutdown?")
    [[ "${yesno}" = Yes ]] && sudo shutdown -h now
elif [[ "${chosen}" = Reboot ]]; then
    yesno=$(echo -e "Yes\nNo" | dmenu -fn "${font}" -nb "${panel_background}" -sb "${selected_background}" -i -p "Do you really want to reboot?")
    [[ "${yesno}" = Yes ]] && sudo reboot
fi
