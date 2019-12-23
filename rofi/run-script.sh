#!/usr/bin/env sh

rofi_config="$XDG_CONFIG_HOME/rofi/"
script_map="$rofi_config/scripts.csv"

get_script() {
    awk -F ',' \
        -v script_name="$1" \
        '{ if ($1 == script_name) print $2 }' scripts.csv
}

# List scripts if no arguments given
if [ -z "$1" ]; then
    cut -d ',' -f 1 "$script_map"
    exit
fi

# Else, try to execute the script
command=$(get_script $1)
[ ! -z "$command" ] && "$command"

# rofi -dmenu -p "Scripts" |
# head -n 1 |
# xargs -i --no-run-if-empty grep "{}" "$MAP" |
# cut -d ',' -f 2 |
# head -n 1 |
# xargs -i --no-run-if-empty /bin/sh -c "{}"
