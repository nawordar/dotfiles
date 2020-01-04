#!/usr/bin/env sh

if tmux ls | grep -v '(attached)$' >/dev/null; then
    tmux attach
else
    tmux new
fi
