#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd $DIR

WALLPAPER=$($DIR/wallpaper)

$(wal -i "$WALLPAPER")

echo $WALLPAPER
