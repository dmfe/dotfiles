#!/bin/bash

panel_background=$(xrdb -query | grep '*.panel_background' | awk '{print $NF}')
selected_background=$(xrdb -query | grep '*.ws_focused' | awk '{print $NF}')

dmenu_run -l 20 -fn Monospace-18 -nb ${panel_background} -sb "${selected_background}"
