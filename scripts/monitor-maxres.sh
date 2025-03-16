#!/bin/bash

monitors=$(xrandr --query | grep " connected" | awk '{print $1}')

for monitor in $monitors; do
    max_res=$(xrandr --query | grep -A1 "^$monitor " | tail -n1 | awk '{print $1}')
    if [ ! -z "$max_res" ]; then
        xrandr --output $monitor --mode $max_res
    fi

done
