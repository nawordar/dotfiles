#!/usr/bin/env sh
# https://wiki.archlinux.org/index.php/Polybar#Running_with_WM

# Restore wpg scheme
# "$XDG_CONFIG_HOME/wpg/wp_init.sh"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u "$(id -u)" -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
if command -v "xrandr" >/dev/null; then
	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		MONITOR=$m polybar main &
	done
else
	polybar main &
fi

# Restart Picom
killall -q picom
picom -b --experimental-backends &

echo "Polybar launched..."
