# shellcheck shell=bash

. "$SHELLDOTDIR/rc"

# Detect `bash --posix` and bail.
# FIXME: It should be sourcing $ENV instead, and we shouldn't need this.
#        Figure out what's happening and make it work.
#        Curiously, bash symlinked to `sh` doesn't have this problem.
if [ "$POSIXLY_CORRECT" = "y" ]; then
  return
fi

BASHDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/bash"

bash_source_if_exists () {
    # If it's an absolute path, try that first.
    [ "$1" != "${1#/}" ] && [ -f "$1" ] && . "$1" && return
    # Otherwise, source it relative to $BASHDOTDIR.
    [ -f "$BASHDOTDIR/$1" ] && . "$BASHDOTDIR/$1"
}

# Enable programmable completions.
if [ -r "/usr/share/bash-completion/bash_completion" ]; then
    . "/usr/share/bash-completion/bash_completion"
elif [ -r "/etc/bash_completion" ]; then
    . "/etc/bash_completion"
else
    echo "bash-completion not installed." >&2
fi

bash_source_if_exists "brew/rc"
bash_source_if_exists "dotnet/rc"
bash_source_if_exists "starship/rc"
