#!/usr/bin/env sh
# -*- coding: utf-8 -*-

wallpaper="$HOME/wallpapers/pixelart/mountain-sunshine.png"

# wal -i "$wallpaper" --saturate 0.7
wpg -s "$wallpaper"
multilockscreen -u "$wallpaper" --display 1
