#!/usr/bin/env sh
# Script to automatically run `chezmoi apply` on file change. Requires inotify-tools to work
exclude='^_|^\.|^#.+#$'
inotifywait -m -e MODIFY \
    @mld.svg \
    @README.md \
    @LICENSE \
    --exclude "$exclude" \
    **/* |
    while read path event file; do
        echo "File $path$file changed. Invoking \`chezmoi apply\`."
        chezmoi apply
    done
