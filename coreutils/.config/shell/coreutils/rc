# shellcheck shell=sh

# With brew, commands also provided by macOS are installed with the prefix "g".
# GNU also provides the commands dir, dircolors and vdir, which are missing on
# macOS. To use the GNU commands _with_ the "g" prefix and the unprefixed dir,
# dircolors and vdir commands, _append_ the gnubin directory to the PATH.
# If we were to _prepend_ the gnubin directory to the PATH, the unprefixed
# commands would shadow the built-in macOS commands.
if [ -n "$HOMEBREW_PREFIX" ]; then
    if ! PATH_try_append "$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin"; then
        # We don't want this to be an error on Linux
        if [ "$(uname)" != "Linux" ]; then
            echo "coreutils: failed to add gnubin to the PATH" >&2
            return 1
        fi
    fi
fi

# Enable color support for `ls`.
if ! { eval_output dircolors -b "$HOME/.dircolors" \
    || eval_output dircolors -b; } then
    echo "coreutils: failed to eval dircolors" >&2
    return 1
fi
