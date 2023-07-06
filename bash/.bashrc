# shellcheck shell=bash

SHELLDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/shell"

. "$SHELLDOTDIR/rc.sh" || return 1

# Detect `bash --posix` and bail.
# FIXME: It should be sourcing $ENV instead, and we shouldn't need this.
#        Figure out what's happening and make it work.
#        Curiously, bash symlinked to `sh` doesn't have this problem.
if [ "$POSIXLY_CORRECT" = "y" ]; then
    return
fi

BASHDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/bash"

# Scripts
for f in "$BASHDOTDIR"/rc.d/*; do
    source_if_exists "$f"
done
unset -v f
