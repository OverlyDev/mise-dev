# mise-dev

## Instructions

### Install

1. Clone the repo
    - Doesn't matter where you clone it to, `mise.toml` is setup to symlink the required files to the right place
1. Modify `mise.toml` as required
    - `MISE_STORAGE_OVERRIDE_DIR` variable in the `[dotfiles]` section
1. Set up GitHub auth for mise ([docs](https://mise.jdx.dev/dev-tools/github-tokens.html#token-files))
    - Create a PAT (no repos or scopes required, auth only)
    - Create/update `~/.config/mise/github_tokens.toml` with the PAT
      - Be sure to `chmod 600 ~/.config/mise/github_tokens.toml`
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
- Boostrap/dotfiles changes:
  - `exec bash install.sh` - The whole thing
  - `mise bootstrap apply dotfiles` - Just the dotfiles section

### Uninstall

1. Run uninstall script: `exec bash uninstall.sh`
    - Same notes as above RE: `exec`

## Notes

`aqua:evilmartians/lefthook`
- Using as-is, would end up with `lefthook` and `lefthook_<version>__Linux_x86_64` binaries/shims/whatever
- To fix:
  - Add `symlink_bins = true` to its entry in `mise.toml`
  - Run `mise install aqua:evilmartians/lefthook --force`
  - Run `mise reshim --force`
