# shellcheck shell=bash

# shellcheck shell=sh

# Source completions, but only if installed to `$HOME/.asdf`.
# Package managers handle completions differently.
source_if_exists "$HOME/.asdf/completions/asdf.bash"

# This is usually appended to .bashrc when
#     asdf direnv setup --shell bash --version system
# is run.
source_if_exists "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/bashrc"
