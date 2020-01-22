# === Basic zsh options === #
setopt autocd
setopt correct

# === History options === | Source: https://scriptingosx.com/2019/06/moving-to-zsh-part-3-shell-options/
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
SAVEHIST=5000
HISTSIZE=2000

# Share history across multiple zsh sessions
setopt share_history

# Append to history instead of overwriting
setopt append_history

# Adds commands as they are typed, not at shell exit
setopt inc_append_history

# Removes blank lines from history
setopt hist_reduce_blanks

# Show the substituted command in the prompt
setopt hist_verify

# Load cdr
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

# Use dynamic directories e.g. ~[1], ~[2] etc.
add-zsh-hook -Uz zsh_directory_name zsh_directory_name_cdr

# Do menu-driven completion. | Source: https://unix.stackexchange.com/a/214699
zstyle ':completion:*' menu selection

# === zsh-autosuggestions === #
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd completion)
ZSH_AUTOSUGGEST_USE_ASYNC=1
