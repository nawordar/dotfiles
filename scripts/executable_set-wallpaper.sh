#!/usr/bin/env sh
# -*- coding: utf-8 -*-

wallpaper="$HOME/wallpapers/landscape/8e598b16ec01dd74.jpeg"

wal -i "$wallpaper" --saturate 0.7
# wpg -s "$wallpaper"
multilockscreen -u "$wallpaper" --display 1
