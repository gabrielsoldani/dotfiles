# shellcheck shell=zsh

function zsh_source_if_exists() {
    # If it's an absolute path, try that first.
    [ "$1" != "${1#/}" ] && [ -f "$1" ] && . "$1" && return
    # Otherwise, source it relative to $ZDOTDIR.
    [ -f "$ZDOTDIR/$1" ] && . "$ZDOTDIR/$1"
}
