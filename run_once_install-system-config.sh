#!/usr/bin/env sh

set -e

. $(chezmoi source-path)/changed_script_prompt

print_nl=1
xorg_restart_required=1
config_files_dir="$(chezmoi source-path)/config_files"

cp_conf() {
	[ ! -d "$2" ] && sudo mkdir -p "$2"

	dest_path="$2/$1"
	if [ -e $dest_path ] &&
		prompt "File $dest_path already exists. Do you want to overwrite it?"; then
		sudo rm "$dest_path"
	else
		return 1
	fi

	sudo cp "$config_files_dir/$1" "$2"
}

print_nl() {
	if [ $print_nl -eq 0 ]; then
		echo
		print_nl=1
	fi
}

install_file() {
	# If the previous command printed any message, add a new line
	print_nl
	if [ "$1" = "--xorg-restart-required" ] || [ "$1" = "-r" ]; then
		_xorg_restart_required=0
		shift
	fi

	conf_file="$1"
	dest="$2"
	msg="$3"
	if ! diff -q "$config_files_dir/$1" "$2/$1" >/dev/null; then
		if prompt "$msg"; then
			# A message has been printed. A newline shall be added before the next prompt
			print_nl=0
			cp_conf "$conf_file" "$dest"

			if [ $_xorg_restart_required -eq 0 ]; then
				xorg_restart_required=0
			fi
		fi
	fi
}

# Activate elephant keys
msg="Do you want to enable the Magic SysRq key?"
if [ $(cat /proc/sys/kernel/sysrq) -ne 1 ] && prompt "$msg"; then
	echo 1 | sudo tee /proc/sys/kernel/sysrq >/dev/null
fi

install_file -r 10-trackball.conf /etc/X11/xorg.conf.d \
	"Do you want to install system-wide trackball config for middle-button emulation and scrolling with forward button?"

install_file lightdm.conf /etc/lightdm \
	"Do you want to install lightdm settings?"

msg="Do you want to automatically enable bluetooth on boot?"
conf_path=/etc/bluetooth/main.conf
grep_res=$(grep -n -m 1 -E 'AutoEnable=(false|true)' "$conf_path" 2>/dev/null)
grep_exit_code=$?
line=$(echo "$grep_res" | sed -e 's/:.*//')
match=$(echo "$grep_res" | sed -e 's/^[[:digit:]]\+://')

if [ $grep_exit_code -eq 0 ] &&       # Found AutoEnable line
	[ "$match" != "AutoEnable=true" ] && # ...but it's not enabled
	prompt "$msg"; then                  # Ask if should be enabled
	sed "${line}s/.*/AutoEnable=true/" "$conf_path" | sudo tee "$conf_path" >/dev/null
fi

if [ $xorg_restart_required -eq 0 ]; then
	echo
	msg="Some of the changes will be visible after X.Org restart. Do you want to do it now?"
	if prompt "$msg"; then
		sudo systemctl restart display-manager
	fi
fi
