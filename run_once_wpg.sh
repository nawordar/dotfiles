#!/usr/bin/env sh

wallpaper="mountain-sunshine"

wpg -a "$HOME/wallpapers/pixelart/$wallpaper.png"
wpg -i "$wallpaper.png" "$HOME/wpg_schemes/$wallpaper"
~/scripts/set-wallpaper.sh
