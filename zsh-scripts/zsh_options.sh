# === Basic zsh options === #
setopt autocd
setopt correct

# Load cdr
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

# Use dynamic directories e.g. ~[1], ~[2] etc.
add-zsh-hook -Uz zsh_directory_name zsh_directory_name_cdr

# Set completion style to menu
zstyle ':completion:*:*:cdr:*:*' menu selection
