# shellcheck shell=bash

# https://docs.brew.sh/Shell-Completion#configuring-completions-in-bash
if [ -n "$HOMEBREW_PREFIX" ]; then
    if [ -r "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" ]; then
        . "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"
    else
        for completion in "$HOMEBREW_PREFIX/etc/bash_completion.d/"*; do
            [ -r "$completion" ] && . "$completion"
        done
        unset -v completion
    fi
else
    echo "brew is not installed" >&2
    return 1
fi
