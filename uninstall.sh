#!/usr/bin/env bash

set -euo pipefail

echo "Removing mise"
mise implode || true

echo "Making backup of ~/.bashrc to ~/.bashrc.bak"
echo "Removing mise-managed lines from ~/.bashrc:"
# Preview lines to be removed
sed -E -n '/# >>> mise:.*>>>/,/# <<< mise:.*<<</p' ~/.bashrc

# Actually delete lines
sed -E -i'.bak' '/# >>> mise:.*>>>/,/# <<< mise:.*<<</d' ~/.bashrc

echo "Removing ~/.config/mise/"
rm -rf ~/.config/mise

exec bash
