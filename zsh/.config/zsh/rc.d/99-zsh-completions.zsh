# shellcheck shell=sh disable=SC3000-SC4000

# FIXME: Source system completions.

# The following lines were added by compinstall
zstyle ':completion:*' completer _expand_alias _expand _complete _ignored _correct _approximate
zstyle :compinstall filename "'$ZDOTDIR/rc.d/99-zsh-completions.zsh'"

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Auto-complete hidden files
_comp_options+=(globdots)
