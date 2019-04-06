#!/bin/env bash
swayidle timeout 180 "~/.config/swaylock/lock.bash 50" \
timeout 300 'swaymsg "output * dpms off"' \
resume 'swaymsg "output * dpms on"' \
before-sleep "~/.config/swaylock/lock.bash 50" &

