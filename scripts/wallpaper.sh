#!/bin/bash

period=${1:-1}
WALLPAPERS_DIR="$SHARE_LOCAL_PICTURES/wallpapers" 

while true
do
    cur_wp_name=$(ls -1 $WALLPAPERS_DIR | shuf | head -n 1)
    xwallpaper --zoom "$WALLPAPERS_DIR/$cur_wp_name"
    sleep ${period}m
done
