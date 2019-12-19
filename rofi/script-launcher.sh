#!/bin/sh

WORKINGDIR="$HOME/.config/rofi/"
MAP="$WORKINGDIR/scripts.csv"

cut -d ',' -f 1 "$MAP" |
    rofi -dmenu -p "Scripts" |
    head -n 1 |
    xargs -i --no-run-if-empty grep "{}" "$MAP" |
    cut -d ',' -f 2 |
    head -n 1 |
    xargs -i --no-run-if-empty /bin/sh -c "{}"

exit 0
