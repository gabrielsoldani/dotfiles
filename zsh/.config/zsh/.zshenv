# shellcheck shell=zsh
function zsh_source_if_exists(){
  [ -f "$1" ] && source "$1"
}

zsh_source_if_exists "$ZDOTDIR/zshenv/nano.zsh"
