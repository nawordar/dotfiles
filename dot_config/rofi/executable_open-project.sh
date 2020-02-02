#!/usr/bin/env sh

rofi_config_location="$XDG_CONFIG_HOME/rofi"

project_map="$rofi_config_location/project_map.csv"

# Find the script path from the script name
get_project_path() {
    awk -F ',' \
        -v project_name="$1" \
        '{ if ($1 == project_name) print $2 }' \
        "$project_map"
}

# List projects if no arguments given
if [ -z "$1" ]; then
    cut -d ',' -f 1 "$project_map"
    exit
fi

get_project_path "$1" |
    head -n 1 |
    xargs -i --no-run-if-empty /bin/sh -c "code {}"
