#!/bin/bash

font="System San Francisco Display 12"

pgrep -x dmenu && exit

chosen=$(echo -e "Shutdown\nReboot" | dmenu -fn "${font}" -i -p "What would you like to do?")
if [[ "${chosen}" = Shutdown ]]; then
    yesno=$(echo -e "Yes\nNo" | dmenu -fn "${font}" -i -p "Do you really want to shutdown?")
    [[ "${yesno}" = Yes ]] && sudo shutdown -h now
elif [[ "${chosen}" = Reboot ]]; then
    yesno=$(echo -e "Yes\nNo" | dmenu -fn "${font}" -i -p "Do you really want to reboot?")
    [[ "${yesno}" = Yes ]] && sudo reboot
fi
