#!/usr/bin/env bash

original_dir="$(pwd)"

# include both in .gitignore
blurred="blur_with_logo.png"
original="screen.jpg"

cd "$(dirname "$0")" || exit

# Capture the screen image, then blur it with ffmpeg later.
grim -t jpeg $original

# Pick an icon from the bundled folder.
if [[ "$2" != "" ]]; then
  cd "$original_dir" || exit
  image=$(realpath "$2")
  cd "$(dirname "$0")" || exit
else
  image="icons/$(shuf -i0-2 -n1).png"
fi

#make background image
rm $blurred

ffmpeg -i $original -vf \
  "[in] gblur=sigma=$1  [blurred]; movie=$image [logo]; 
  [blurred][logo] overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2 [out]" \
  $blurred

#import pywal colors
# shellcheck source=/home/master/.cache/wal/colors.sh
#source "$HOME/.cache/wal/colors.sh"

# swaylock \
#   --image "$HOME/.config/swaylock/blur_with_logo.png" \
#   --daemonize \
#   --indicator-radius 160 \
#   --indicator-thickness 20 \
#   --inside-color 00000000 \
#   --inside-clear-color 00000000 \
#   --inside-ver-color 00000000 \
#   --inside-wrong-color 00000000 \
#   --key-hl-color "$color1" \
#   --bs-hl-color "$color2" \
#   --ring-color "$background" \
#   --ring-clear-color "$color2" \
#   --ring-wrong-color "$color5" \
#   --ring-ver-color "$color3" \
#   --line-uses-ring \
#   --line-color 00000000 \
#   --font 'NotoSans Nerd Font Mono:style=Thin,Regular 40' \
#   --text-color 00000000 \
#   --text-clear-color 00000000 \ #"$color2" \
#   --text-wrong-color 00000000 \ #"$color5" \
#   --text-ver-color 00000000 \ #"$color4" \
#   --separator-color 00000000 \
  
swaylock \
  --image "$HOME/.config/swaylock/blur_with_logo.png" \
  --daemonize \
  --indicator-radius 160 \
  --indicator-thickness 20 \
  --line-uses-ring \
  --inside-color 00000000 \
  --inside-clear-color 00000000 \
  --inside-ver-color 00000000 \
  --inside-wrong-color 00000000 \
  --font 'NotoSans Nerd Font Mono:style=Thin,Regular 40' \
  
