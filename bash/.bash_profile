# shellcheck shell=bash

# Source common shell profile
. "$HOME/.profile" || return 1

# Check if we're an interactive shell
if [[ "$-" == *i* ]]; then
    # Bash doesn't source ~/.bashrc if it's invoked as a login shell,
    # so we do it ourselves.
    . "$HOME/.bashrc" || return 1
fi
