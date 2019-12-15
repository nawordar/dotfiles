# === Debian ♥ Arch Linux === #
# If apt or yay do not exists, create appropriate functions
if ! cmd_available apt && cmd_available yay; then
    apt() {

        # Source: https://stackoverflow.com/a/59126818/9327802
        local all_args=("$@")
        local first_arg=$1
        local rest_args=("${all_args[@]:1}")

        case "$1" in
        install)
            yay -S "${rest_args[@]}"
            ;;
        search)
            yay -Ss "${rest_args[@]}"
            ;;
        update)
            echo "Not implemented"
            ;;
        *)
            echo "Not implemented"
            ;;
        esac
    }
fi
