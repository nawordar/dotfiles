autoload -U zcalc
function __calc_plugin {
    zcalc -e "$*"
}
aliases[calc]='noglob __calc_plugin'
aliases[=]='noglob __calc_plugin'

# Inspired by the above dc plugin
function __dc_plugin { dc -e "5k$*pq" }
aliases[==]='noglob __dc_plugin'

# Don't remind me of these aliases
export YSU_IGNORED_ALIASES=()
export YSU_IGNORED_GLOBAL_ALIASES=("...")
