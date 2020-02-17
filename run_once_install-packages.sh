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
        python-pywal \
        feh \
        picom \
        ttf-cascadia-code \
        playerctl \
        snapd \
        rofi \
        rofi-pass \
        thefuck \
        tmux \
        firefox \
        neovim \
        yarn \
        npm \
        xfce-theme-greybird \
        elementary-icon-theme \
        gpick \
        autorandr \
        xorg-fonts-misc \
        thunar \
        spectacle \
        atril \
        libreoffice-still \
        libreoffice-still-pl \
        elementary-xfce-icons \
        xorg-xbacklight \
        playerctl \
        pulsemixer \
        pulseaudio \
        pulseaudio-alsa
fi

# Remove 70-no-bitmaps.conf
if [ -e "/etc/fonts/conf.d/70-no-bitmaps.conf" ]; then
    sudo rm "/etc/fonts/conf.d/70-no-bitmaps.conf"
fi

# Install fzf
if [ ! -d "$HOME/.fzf" ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf &&
        ~/.fzf/install
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
# systemctl_enable snapd.apparmor.service

# Install wpg
if ! command -v wpg >/dev/null; then
    sudo pip3 install wpgtk
    wpg-install.sh -ig
fi

# Install code
if ! command -v code >/dev/null; then
    sudo snap install code --classic
fi

# Install vim-plug
if [ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]; then
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
