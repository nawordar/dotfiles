#!/usr/bin/env sh
set -euo pipefail

session_name=mopidy

if ! tmux has-session -t "$session_name" >/dev/null 2>&1; then
	tmux new-session -s "$session_name" -n mopidy -d
	tmux send-keys -t "$session_name" 'teamocil mopidy' C-m
fi
