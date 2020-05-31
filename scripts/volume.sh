#!/bin/bash

sink=$( pactl list short sinks | sed -e 's,^\([0-9][0-9]*\)[^0-9].*,\1,' | tail -n 1 )

case $BLOCK_BUTTON in
     2) pactl set-sink-mute $sink toggle ;;
     4) pactl set-sink-volume $sink +5% ;;
     5) pactl set-sink-volume $sink -5% ;;
esac

muted=$( awk '/muted/ {print $2}' <(pacmd list-sinks | grep '^[[:space:]]muted:' | head -n $(( $sink + 1 )) | tail -n 1 ) )

if [ "$muted" = "yes" ]; then
  icon="🔇"
  printf "%s\\n" "$icon"
else
  vol=$( pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $sink + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,' )
  if [ "$vol" -gt 60 ]; then
    icon="🔊"
  elif [[ "$vol" -le 60 && "$vol" -gt 30 ]]; then
    icon="🔉"
  else
    icon="🔈"
  fi

  printf "%s %s%%\\n" "$icon" "$vol"
fi
