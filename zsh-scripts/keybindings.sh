# Set emacs mode (what is changing it to vi mode?)
bindkey -e

#  {for,back}ward-word to the nearest symbol or space
autoload -U select-word-style
select-word-style bash

# Use M-, for copying earlier word | Source: https://stackoverflow.com/a/34861762/9327802
autoload -Uz copy-earlier-word
zle -N copy-earlier-word
bindkey "^[," copy-earlier-word

# === Standard keybindings === #
# Source: https://silvercircle.github.io/2017/10/26/cygwin-zsh-delete-home-end-keys/

# ctrl-left and ctrl-right
bindkey "\e[1;5D" backward-word
bindkey "\e[1;5C" forward-word

# ctrl-bs and ctrl-del
bindkey "\e[3;5~" kill-word
bindkey "\033d" kill-word
bindkey "\C-_"    backward-kill-word

# del, home and end
bindkey "\e[3~" delete-char
bindkey "\e[H"  beginning-of-line
bindkey "\033[1~" beginning-of-line
bindkey "\e[F"  end-of-line
bindkey "\033[4~" end-of-line

# S-Tab | Source: https://stackoverflow.com/a/842370/9327802
bindkey '^[[Z' reverse-menu-complete

# Partial search
bindkey '^[OA' up-line-or-search
bindkey '^[OB' down-line-or-search

# M-z
bindkey "\033z"  undo

# Fullscreen editor | Source: https://unix.stackexchange.com/a/34251
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line
