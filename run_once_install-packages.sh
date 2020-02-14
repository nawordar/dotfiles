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
        feh \
        spotify-client \
        playerctl \
        tmux
fi

if command -v yay >/dev/null; then
    yay --needed -S \
        kitty \
        polybar \
        polybar-spotify-git \
        spotifywm-git \
        spotify \
        python-pywal \
        feh \
        picom \
        ttf-cascadia-code \
        playerctl \
        snapd \
        betterlockscreen \
        rofi \
        rofi-pass \
        thefuck \
        tmux \
        firefox \
        multilockscreen-git \
        nvim
fi

# Install snap
systemctl_enable() {
    if ! systemctl list-unit-files |
        grep enabled |
        grep "$1" >/dev/null; then
        sudo systemctl enable --now "$1"
    fi
}
systemctl_enable snapd.socket
systemctl_enable apparmor.service
systemctl_enable snapd.apparmor.service

# Install code
if ! command -v code >/dev/null; then
    sudo snap install code --classic
fi
