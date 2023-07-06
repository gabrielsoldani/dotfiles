# shellcheck shell=sh

. "$SHELLDOTDIR/lib.sh" || return 1

# Scripts
for f in "$SHELLDOTDIR"/rc.d/*; do
    source_if_exists "$f"
done
unset -v f
