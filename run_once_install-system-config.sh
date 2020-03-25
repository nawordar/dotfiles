#!/usr/bin/env sh

. $(chezmoi source-path)/changed_script_prompt

xorg_restart_required=1

cp_conf() {
	[ ! -d "$2" ] && sudo mkdir -p "$2"

	dest_path="$2/$1"
	if [ -e $dest_path ] &&
		prompt "File $dest_path already exists. Do you want to overwrite it?"; then
		sudo rm "$dest_path"
	else
		return 1
	fi

	sudo cp "$(chezmoi source-path)/config_files/$1" "$2"
}

msg="Do you want to install system-wide trackball config for middle-button emulation and scrolling with forward button?"
if prompt "$msg"; then
	xorg_restart_required=0
	cp_conf 10-trackball.conf /etc/X11/xorg.conf.d
fi

echo
msg="Do you want to install lightdm settings?"
if prompt "$msg"; then
	cp_conf lightdm.conf /etc/lightdm
fi

if [ $xorg_restart_required -eq 0 ]; then
	echo
	msg="Some of the changes will be visible after X.Org restart. Do you want to do it now?"
	if prompt "$msg"; then
		sudo systemctl restart display-manager
	fi
fi
