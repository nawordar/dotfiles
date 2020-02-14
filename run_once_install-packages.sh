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

echo "run_once_install-packages.sh has changed. Do you want to run it now? (Y/n)"
read answer
case $answer in
'' | y | Y | yes) answer="y" ;;
*) answer="n" ;;
esac

if [ $answer = "n" ]; then
    exit
fi

if command -v apt >/dev/null; then
    sudo apt install \
        kitty \
        feh
fi

if command -v yay >/dev/null; then
    yay --needed -S \
        kitty \
        polybar \
        polybar-spotify-git \
        spotifywm-git \
        python-pywal \
        feh \
        picom
fi
