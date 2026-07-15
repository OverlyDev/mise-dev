# mise-dev

## Instructions

### Install

1. Clone the repo
1. Modify the `MISE_STORAGE_OVERRIDE_DIR` variable in the `[dotfiles]` section as required
1. Run install script: `exec bash install.sh`
    - We use `exec` to replace our current shell after things get added/updated
    - This removes the requirement to close/reopen the terminal to load the changes

### Uninstall

1. Run uninstall script: `exec bash uninstall.sh`
    - Same notes as above RE: `exec`
