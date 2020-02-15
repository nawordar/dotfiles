#!/usr/bin/env sh

wallpaper="mountain-sunshine.png"

wpg -a "~/wallpapers/pixelart/$wallpaper"
wpg -i "$wallpaper" "~/wpg_schemes/$wallpaper"
~/scripts/set-wallpaper.sh
