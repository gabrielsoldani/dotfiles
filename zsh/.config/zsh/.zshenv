# shellcheck shell=zsh

function zsh_source_if_exists(){
  [ -f "$ZDOTDIR/$1" ] && source "$ZDOTDIR/$1"
}
