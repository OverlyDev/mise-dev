# mise-dev

## Instructions

### Install

1. Clone the repo
1. Modify the `MISE_STORAGE_OVERRIDE_DIR` variable in the `[dotfiles]` section as required
1. Run install script: `exec bash install.sh`
    - We use `exec` to replace our current shell after things get added/updated
    - This removes the requirement to close/reopen the terminal to load the changes

#### VSCode

> This section is a work in progress!

To setup VSCode with mise, add the below lines to your user configuration.

Access via: Ctrl + Shift + P -> Open User Settings (JSON)
```json
{
    "mise.configureExtensionsAutomatically": true,
    "mise.configureExtensionsIncludeGlobalTools": true
}
```
Reload via: Ctrl + Shift + P -> Reload Window

The combo of the above config and `mise.toml` adding shims to `~/.bash_profile` *should* make extensions "just work".

For extensions that still don't work, point them manually to the binary at:
- `$MISE_DATA_DIR/shims/<binary name>`
  - Note: Use the full/resolved path, no variables

### Updates

In order to apply changes made to `mise.toml`, from this repo directory run:

- Tool changes: `mise install`
- Boostrap/dotfiles changes: `exec bash install.sh`

### Uninstall

1. Run uninstall script: `exec bash uninstall.sh`
    - Same notes as above RE: `exec`
