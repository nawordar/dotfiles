#!/usr/bin/env bash
# -*- coding: utf-8 -*-

wallpaper="$HOME/wallpapers/pixelart/waterfall.png"

wal -i "$wallpaper" --saturate 0.7
multilockscreen -u "$wallpaper" --display 1
