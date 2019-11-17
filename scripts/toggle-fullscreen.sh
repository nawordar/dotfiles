#!/usr/bin/env sh

if [ -e /tmp/fullscreen_enabled ] && [ `cat /tmp/fullscreen_enabled` == 0 ]; then
    is_fullscreen_enabled=0
else
    is_fullscreen_enabled=1
fi

if [ $is_fullscreen_enabled == 0 ]; then
    i3-msg fullscreen disable >/dev/null &
    polybar-msg cmd show >/dev/null &
    echo 1 > /tmp/fullscreen_enabled
else
    i3-msg fullscreen enable >/dev/null
    polybar-msg cmd hide >/dev/null &
    echo 0 > /tmp/fullscreen_enabled
fi
