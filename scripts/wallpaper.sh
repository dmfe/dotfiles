#!/bin/bash

period=$1
wp_dir=~/Pictures/wallpapers

while true
do
    cur_wp_name=$(ls -1 $wp_dir | shuf | head -n 1)

#    echo $cur_wp_name
    feh --bg-scale $wp_dir/$cur_wp_name

    sleep ${period}m
done
