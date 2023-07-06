# shellcheck shell=bash

. "$SHELLDOTDIR/rc.sh" || return 1

# Scripts
for f in "$ZDOTDIR"/rc.d/*; do
    source_if_exists "$f"
done
unset -v f

# Plugins
for f in "$ZDOTDIR"/plugins/*; do
    source_if_exists "$f/${f##*/}.zsh"
done

# Uncomment the following line (and the corresponding one in .zprofile)
# to enable profiling.
# zprof
