#!/usr/bin/env sh

if tmux ls 2>&1 | grep -v '\(^no server running\|^error connecting\|(attached)$\)' >/dev/null; then
    tmux attach
else
    tmux new
fi
