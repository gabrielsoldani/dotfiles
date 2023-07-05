# shellcheck shell=bash

if ! . "$SHELLDOTDIR/rc"; then
    return 1
fi

# Detect `bash --posix` and bail.
# FIXME: It should be sourcing $ENV instead, and we shouldn't need this.
#        Figure out what's happening and make it work.
#        Curiously, bash symlinked to `sh` doesn't have this problem.
if [ "$POSIXLY_CORRECT" = "y" ]; then
    return
fi

BASHDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/bash"

# Enable programmable completions.
source_if_exists "/usr/share/bash-completion/bash_completion" \
    || source_if_exists "/etc/bash_completion" \
    || echo "bash-completion not installed." >&2

source_if_exists "$BASHDOTDIR/asdf/rc"
source_if_exists "$BASHDOTDIR/brew/rc"
source_if_exists "$BASHDOTDIR/dotnet/rc"
source_if_exists "$BASHDOTDIR/starship/rc"
