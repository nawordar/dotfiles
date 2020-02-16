# Load zmv
autoload -U zmv

# Add alias for automatic asterisk replacement
alias mmv='noglob zmv -W'

# Add aliases for copying and linking
alias zcp='zmv -C'
alias zln='zmv -L'
alias ccp='zmv -CW'
alias lln='zmv -LW'
