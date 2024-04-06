#!/bin/bash

Xephyr -br -ac -reset -screen 1920x1080 :1 &
# Xephyr -br -ac -reset -screen 800x600 :1 &
sleep 1s

export DISPLAY=:1

wallpaper 20 &
xrdb ~/.Xresources
$1 &

