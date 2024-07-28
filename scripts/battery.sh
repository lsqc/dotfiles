#!/bin/bash

battery_level=$(acpi -b | grep -P -o '[0-9]+(?=%)')

if [ "$battery_level" -le 1000 ]; then
    DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u)/bus notify-send "⚠️ Battery Warning" "$battery_level% charge remaining"
fi
