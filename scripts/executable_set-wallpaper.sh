#!/usr/bin/env sh
# -*- coding: utf-8 -*-

wallpaper="mountain-sunshine.png"
wallpaper_path="$HOME/wallpapers/pixelart/"

# wal -i "$wallpaper" --saturate 0.7
wpg -s "$wallpaper"
multilockscreen -u "$wallpaper_path" --display 1
