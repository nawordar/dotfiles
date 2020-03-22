#!/usr/bin/env bash

echo -n "run_once_install-packages.sh has changed. Do you want to run it now? (Y/n) "
read answer
case $answer in
'' | y | Y | yes) answer="y" ;;
*) answer="n" ;;
esac

if [ $answer = "n" ]; then
	exit
fi

# Install only packages that are not installed yet. Based on: https://wiki.archlinux.org/index.php/Pacman/Tips_and_tricks#Install_packages_from_a_list
echo "Looking for packages that are not installed..."
packages=$(echo "kitty
python-pywal
feh
picom
ttf-cascadia-code
rofi-pass
thefuck
tmux
firefox
neovim
yarn
npm
elementary-icon-theme
gpick
autorandr
xorg-fonts-misc
thunar
spectacle
atril
libreoffice-still
libreoffice-still-pl
xorg-xbacklight
playerctl
pulsemixer
pulseaudio
pulseaudio-alsa
pavucontrol
acpi_call-dkms
emacs
otf-fira-code
i3-gaps
python-pip
python2
python2-pip
lightdm
lightdm-gtk-greeter
xorg-server
xorg-xrdb
python-gobject
lxqt-policykit
shfmt
qt5-styleplugins
polybar-spotify-git
spotify
spotifywm-git
betterlockscreen
multilockscreen-git
siji-git
ttf-unifont
ferdi-bin
dragon-drag-and-drop
xcursor-openzone
splatmoji-git
snapd
xfce-theme-greybird
elementary-xfce-icons
rofi-dmenu
dunst" | sort)
installed=$(yay -Qqe | sort)
not_installed=$(comm -13 <(echo "$installed") <(echo "$packages"))
not_installed_count=$(echo "$not_installed" | wc -l)

if [ "$not_installed_count" -eq 0 ]; then
	echo "No new packages, exiting"
else
	yay -S "$not_installed"
fi

# Install bash-language-server
if ! command -v bash-language-server >/dev/null; then
	sudo yarn global add bash-language-server
fi

# Enable lightdm service
systemctl_enable() {
	if ! systemctl list-unit-files |
		grep enabled |
		grep "$1" >/dev/null; then
		sudo systemctl enable --now "$1"
	fi
}
systemctl_enable lightdm.service

# Remove 70-no-bitmaps.conf
if [ -e "/etc/fonts/conf.d/70-no-bitmaps.conf" ]; then
	sudo rm "/etc/fonts/conf.d/70-no-bitmaps.conf"
fi

# Install fzf
if [ ! -d "$HOME/.fzf" ]; then
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf &&
		~/.fzf/install
fi

# Install wpg
if ! command -v wpg >/dev/null; then
	sudo pip3 install wpgtk
	mkdir -p ~/.config/wpg/templates
	mkdir -p ~/.themes
	wpg-install.sh -ig
	wpg -i ~/wallpapers/pixelart/mountain-sunshine.png ~/wpg_schemes/mountain-sunshine.json
	wpg -s ~/wallpapers/pixelart/mountain-sunshine.png
fi

# Install vim-plug
if [ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]; then
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
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

# Create symlink to enable classic confinement
[ ! -L /snap ] && sudo ln -s /var/lib/snapd/snap /snap

# Install code
if ! command -v code >/dev/null; then
	sudo snap install code --classic
fi
