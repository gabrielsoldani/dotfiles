function zsh_source_if_exists(){
  [ -f "$1" ] && source "$1"
}