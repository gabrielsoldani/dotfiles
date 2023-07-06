# shellcheck shell=sh

# Source completions, but only if installed to `$HOME/.asdf`.
# Package managers handle completions differently.
source_if_exists "$HOME/.asdf/completions/asdf.zsh"

# This is usually appended to .zshrc when
#     asdf direnv setup --shell zsh --version system
# is run.
source_if_exists "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"
