#!/usr/bin/env sh

ls -t ~/Downloads/ergodox_ez_*.hex | head -n1 | xargs wally-cli
