#  {for,back}ward-word to the nearest symbol or space
autoload -U select-word-style
select-word-style bash

# Use M-, for copying earlier word | Source: https://stackoverflow.com/a/34861762/9327802
autoload -Uz copy-earlier-word
zle -N copy-earlier-word
bindkey "^[," copy-earlier-word
