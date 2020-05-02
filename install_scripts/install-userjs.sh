#!/usr/bin/env bash
set -euo pipefail

export PATH="$(chezmoi source-path)/tools":$PATH

ff_profile_path="$HOME/.mozilla/firefox/$(get_default_ff_profile)"

[ -f "$ff_profile_path/user.js" ] && rm "$ff_profile_path/user.js"

cp "$(chezmoi source-path)/install_scripts/user.js" "$ff_profile_path"
