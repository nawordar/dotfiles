#!/usr/bin/env bash

. $(chezmoi source-path)/changed_script_prompt

# Install only packages that are not installed yet. Based on: https://wiki.archlinux.org/index.php/Pacman/Tips_and_tricks#Install_packages_from_a_list
echo "Looking for packages that are not installed..."
packages=$(echo "acpi_call-dkms
atril
autorandr
betterlockscreen
bluez-utils
code
dragon-drag-and-drop
dunst
elementary-icon-theme
elementary-xfce-icons
emacs
feh
ferdi-bin
firefox
gimp
gimp-plugin-resynthesizer
gpick
gtk-engine-murrine
htop
i3-gaps
isync
kitty
libreoffice-still
libreoffice-still-pl
lightdm
lightdm-gtk-greeter
lxappearance-gtk3
lxqt-policykit
mu
multilockscreen-git
ncdu
neovim
npm
numlockx
otf-fira-code
pavucontrol
picom
playerctl
polybar-spotify-git
pulseaudio
pulseaudio-alsa
pulseaudio-modules-bt-git
pulsemixer
python-gobject
python-pip
python-pywal
python2
python2-pip
qt5-styleplugins
ripgrep
rofi-dmenu
rofi-pass
shellcheck
shfmt
siji-git
snapd
spectacle
splatmoji-git
spotify
spotifywm-git
subversion
tex-gyre-fonts
thefuck
thunar
tmux
ttf-cascadia-code
ttf-liberation
ttf-unifont
xcursor-openzone
xfce-theme-greybird
xorg-fonts-misc
xorg-server
xorg-xbacklight
xorg-xrdb
yarn
zip" | sort)
installed=$(yay -Qqe | sort)
not_installed=$(comm -13 <(echo "$installed") <(echo "$packages"))
not_installed_count=$(echo "$not_installed" | wc -l)

if [ "$not_installed_count" -eq 0 ]; then
	echo "No new packages, exiting"
else
	echo "Found $not_installed_count packages, installing"
	yay -S --needed $not_installed
fi

# Install bash-language-server
if ! command -v bash-language-server >/dev/null; then
	sudo yarn global add bash-language-server
fi

# Install prettier
if ! command -v prettier >/dev/null; then
	sudo yarn global add prettier
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

systemctl_enable() {
	if ! systemctl list-unit-files |
		grep enabled |
		grep "$1" >/dev/null; then
		sudo systemctl enable --now "$1"
	fi
}

systemctl_enable_user() {
	if ! systemctl list-unit-files |
		grep enabled |
		grep "$1" >/dev/null; then
		systemctl enable --user --now "$1"
	fi
}

# # Install snap
# systemctl_enable snapd.socket
# systemctl_enable apparmor.service

# # Create symlink to enable classic confinement
# [ ! -L /snap ] && sudo ln -s /var/lib/snapd/snap /snap

# # Install code
# if ! command -v code >/dev/null; then
# 	sudo snap install code --classic
# fi

# Enable bluetooth
systemctl_enable bluetooth.service
systemctl_enable bluetooth-autoconnect.service
# systemctl_enable_user pulseaudio-bluetooth-autoconnect.service
