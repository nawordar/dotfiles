#!/usr/bin/env sh

prompt=$(chezmoi source-path)/tools/prompt

if [ ! -d "$HOME/clones" ]; then
    mkdir "$HOME/clones"
fi

if [ ! -d "$HOME/clones/chemacs" ]; then
    if ! prompt "Chemacs was not found. Do you want to install it now?"; then
        exit
    fi

    git clone --depth 1 https://github.com/plexus/chemacs.git "$HOME/clones/chemacs"
    "$HOME/clones/chemacs/install.sh"
    echo
fi

if [ ! -d "$HOME/clones/doom-emacs" ]; then
    if ! prompt "Doom Emacs was not found. Do you want to install it now?"; then 
        exit
    fi

    git clone --depth 1 https://github.com/hlissner/doom-emacs "$HOME/clones/doom-emacs"
    [ ! -d ~/.local/bin ] && mkdir -p ~/.local/bin
    ln -s "$HOME/clones/doom-emacs/bin/doom" "$HOME/.local/bin/doom"

    doom install
    echo
fi
