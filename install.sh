#!/usr/bin/env bash
set -euo pipefail

# Install mise if missing
if ! command -v mise &> /dev/null; then
    curl -fsSL https://mise.run | sh
fi

# Manually/temporarily add ~/.local/bin to PATH so script can find mise
export PATH="$HOME/.local/bin:$PATH"

# Trust mise.toml in the current directory
mise trust .

# Run minimal mise bootstrap
# This lets us override install/cache dirs before things get installed
mise bootstrap --only dotfiles --only mise-shell-activate --yes

# Run full bootstrap in a new shell to pick up changes from previous bootstrap
bash -i -c "mise bootstrap --yes"

# Start new shell to pick up changes after full bootstrap
exec bash
