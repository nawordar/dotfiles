#!/usr/bin/env sh

# case $HOSTNAME in

# # PC
# nawordar-H81M-S1)
#     export EDITOR=vim
#     export TERMINAL=/usr/bin/xfce4-terminal
#     ;;

# # Notebook
# cezary-notebook)
#     export EDITOR=vim
#     export TERMINAL=/usr/bin/kitty
#     ;;
# esac

if command -v apt >/dev/null; then
    sudo apt install \
        kitty
fi

if command -v yay >/dev/null; then
    yay -S \
        kitty \
        polybar \
        python-pywal
fi
