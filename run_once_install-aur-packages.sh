#!/usr/bin/env sh

# Run only on Arch
! command -v yay >/dev/null && exit

echo "run_once_install-aur-packages.sh has changed. Do you want to run it now? (Y/n)"
read answer
case $answer in
'' | y | Y | yes) answer="y" ;;
*) answer="n" ;;
esac

if [ $answer = "n" ]; then
    exit
fi

yay --needed -S \
    polybar-spotify-git \
    spotifywm-git \
    betterlockscreen \
    multilockscreen-git \
    siji-git \
    ttf-unifont
