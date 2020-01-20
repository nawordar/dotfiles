#!/usr/bin/env sh
# Script to automatically run `chezmoi apply` on file change. Requires inotify-tools to work
exclude='^_|^\.|^#.+#$|mld\.svg|README\.md|LICENSE|watch\.sh'
inotifywait -rm -e MODIFY \
    * \
    --exclude "$exclude" |
    while read path event file; do
        echo "File $path$file changed. Invoking \`chezmoi apply\`."
        chezmoi apply
    done
