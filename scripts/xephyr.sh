#!/bin/bash

Xephyr -br -ac -reset -screen 1920x1080 :5 &
sleep 1s
export DISPLAY=:5
$1 &

