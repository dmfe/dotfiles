#!/bin/bash

Xephyr -br -ac -reset -screen 1920x1080 :5 &
# Xephyr -br -ac -reset -screen 800x600 :1 &
sleep 1s

export DISPLAY=:5

# wallpaper 20 &
xrdb ~/.Xresources
$1 &

