# shellcheck shell=bash

. "$SHELLDOTDIR/rc"

BASHDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/bash"

bash_source_if_exists () {
  [ -f "$BASHDOTDIR/$1" ] && . "$BASHDOTDIR/$1"
}

bash_source_if_exists "starship/rc"
