#!/bin/env bash
swayidle timeout 300 "~/.config/swaylock/lock.bash 50" \
timeout 600 'swaymsg "output * dpms off"' \
resume 'swaymsg "output * dpms on"' \
before-sleep "~/.config/swaylock/lock.bash 50" &

