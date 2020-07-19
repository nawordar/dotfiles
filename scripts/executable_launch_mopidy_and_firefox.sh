#!/usr/bin/env sh
# Wait for mopidy to load and launch Firefox

mopidy 2>&1 | while IFS= read -r line; do
	echo $line

	if [ "$line" = '  Starting GLib mainloop' ]; then
		echo Launching Firefox
		firefox localhost:6680/iris
	fi
done
