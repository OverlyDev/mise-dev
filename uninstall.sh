#!/usr/bin/env bash

set -euo pipefail

# Helper function to remove mise-managed lines from specified file
cleanup_mise_lines() {
    local file="$1"
    local backup="$1.bak-$(date +'%s')"

    echo "Backing up $file to $backup"
    cp "$file" "$backup"

    echo "Removing mise-managed lines from $file:"
    # Preview lines to be removed
    sed -E -n '/# >>> mise:.*>>>/,/# <<< mise:.*<<</p' "$file"

    # Actually delete lines
    sed -E -i '/# >>> mise:.*>>>/,/# <<< mise:.*<<</d' "$file"
}

echo "Removing mise"
mise implode || true

# echo "Making backup of ~/.bashrc to ~/.bashrc.bak"
# echo "Removing mise-managed lines from ~/.bashrc:"
# # Preview lines to be removed
# sed -E -n '/# >>> mise:.*>>>/,/# <<< mise:.*<<</p' ~/.bashrc

# # Actually delete lines
# sed -E -i'.bak' '/# >>> mise:.*>>>/,/# <<< mise:.*<<</d' ~/.bashrc

cleanup_mise_lines "$HOME/.bashrc"
cleanup_mise_lines "$HOME/.bash_profile"

echo "Removing ~/.config/mise/"
rm -rf ~/.config/mise

exec bash
