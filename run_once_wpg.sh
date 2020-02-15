#!/usr/bin/env sh

wallpaper="mountain-sunshine"

wpg -a "~/wallpapers/pixelart/$wallpaper.png"
wpg -i "$wallpaper.png" "~/wpg_schemes/$wallpaper"
~/scripts/set-wallpaper.sh
