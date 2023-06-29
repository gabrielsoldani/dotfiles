# shellcheck shell=sh

zsh_source_if_exists () {
    # If it's an absolute path, try that first.
    [ "$1" != "${1#/}" ] && [ -f "$1" ] && . "$1" && return
    # Otherwise, source it relative to $ZDOTDIR.
    [ -f "$ZDOTDIR/$1" ] && . "$ZDOTDIR/$1"
}

zsh_load_plugin () {
    zsh_source_if_exists "$ZDOTDIR/plugins/$1/$1.zsh" \
        || { command -v "brew" >/dev/null 2>&1 \
            && zsh_source_if_exists "$HOMEBREW_PREFIX/share/$1/$1.zsh"; } \
        || zsh_source_if_exists "/usr/share/zsh/plugins/$1/$1.zsh" \
        || zsh_source_if_exists "/usr/local/share/$1/$1.zsh" \
        || zsh_source_if_exists "/usr/share/$1/$1.zsh" \
        || { echo "$1 is not installed" >&2; return 1; }
}
