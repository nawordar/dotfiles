#!/usr/bin/env sh

rofi_config="$XDG_CONFIG_HOME/rofi/"
script_map="$rofi_config/scripts.csv"

# Find the script path from the script name
get_script_path() {
    awk -F ',' \
        -v script_name="$1" \
        '{ if ($1 == script_name) print $2 }' "$script_map"
}

# List scripts if no arguments given
if [ -z "$1" ]; then
    cut -d ',' -f 1 "$script_map"
    exit
fi

get_script_path "$1" |
    head -n 1 |
    xargs -i --no-run-if-empty /bin/sh -c "{}"
