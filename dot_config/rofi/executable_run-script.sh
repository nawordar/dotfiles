#!/usr/bin/env sh

rofi_config_location="$XDG_CONFIG_HOME/rofi"

private_script_map="$rofi_config_location/private_script_map.csv"
public_script_map="$rofi_config_location/public_script_map.csv"

concat_script_maps() {
    cat "$private_script_map" "$public_script_map"
}

# Find the script path from the script name
get_script_path() {
    concat_script_maps |
        awk -F ',' \
            -v script_name="$1" \
            '{ if ($1 == script_name) print $2 }'
}

# List scripts if no arguments given
if [ -z "$1" ]; then
    concat_script_maps |
        cut -d ',' -f 1
    exit
fi

get_script_path "$1" |
    head -n 1 |
    xargs -i --no-run-if-empty /bin/sh -c "{}" >/dev/null &
