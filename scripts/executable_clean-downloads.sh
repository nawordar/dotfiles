#!/usr/bin/env sh

downloads="$(xdg-user-dir DOWNLOAD)"

# Remove files older than 30 days
find "$downloads"/* -type f -mtime +30 -exec gio trash {} \;

# Remove empty directories
find "$downloads"/* -type d -empty -exec gio trash {} \;
