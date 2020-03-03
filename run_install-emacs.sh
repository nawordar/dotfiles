#!/usr/bin/env sh

if [ ! -d "$HOME/clones" ]; then
    mkdir "$HOME/clones"
fi

if [ ! -d "$HOME/clones/chemacs" ]; then
    echo "Chemacs was not found. Do you want to install it now? (Y/n)"
    read answer
    case $answer in
    '' | y | Y | yes) answer="y" ;;
    *) answer="n" ;;
    esac

    if [ $answer = "n" ]; then
        exit
    fi

    git clone https://github.com/plexus/chemacs.git "$HOME/clones/chemacs"
    "$HOME/clones/chemacs/install.sh"
    echo
fi

if [ ! -d "$HOME/clones/doom-emacs" ]; then
    echo "Doom Emacs was not found. Do you want to install it now? (Y/n)"
    read answer
    case $answer in
    '' | y | Y | yes) answer="y" ;;
    *) answer="n" ;;
    esac

    if [ $answer = "n" ]; then
        exit
    fi

    git clone https://github.com/hlissner/doom-emacs "$HOME/clones/doom-emacs"
    ln -s "$HOME/clones/doom-emacs/bin/doom" "$HOME/.local/bin/doom"

    doom install
    echo
fi
