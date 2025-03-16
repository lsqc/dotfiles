#!/bin/bash

monitors=$(xrandr --query | grep " connected" | awk '{print $1}')
vga_monitor=""
primary_monitor=""

for monitor in $monitors; do
    if [[ "$monitor" == vga* ]]; then
        vga_monitor=$monitor
    elif [[ "$monitor" == "edp-1" || "$monitor" == "lvds-1" ]]; then
        primary_monitor=$monitor
    fi
done

if [ -n "$vga_monitor" ] && [ -n "$primary_monitor" ]; then
    max_res_vga=$(xrandr --query | grep -A1 "^$vga_monitor " | tail -n1 | awk '{print $1}')
    max_res_primary=$(xrandr --query | grep -A1 "^$primary_monitor " | tail -n1 | awk '{print $1}')
    
    if [ -n "$max_res_vga" ] && [ -n "$max_res_primary" ]; then
        xrandr --output $primary_monitor --mode $max_res_primary --primary
        xrandr --output $vga_monitor --mode $max_res_vga --right-of $primary_monitor
    fi
else
    for monitor in $monitors; do
        max_res=$(xrandr --query | grep -A1 "^$monitor " | tail -n1 | awk '{print $1}')
        
        if [ -n "$max_res" ]; then
            xrandr --output $monitor --mode $max_res
        fi
    done
fi

