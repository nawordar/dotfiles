#!/usr/bin/env sh
export PULSE_RUNTIME_PATH="/run/user/$(id -u)/pulse/"

amixer -q -D pulse set Master mute
i3-msg '[title="Private\ Browsing"] move scratchpad'
