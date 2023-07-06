# shellcheck shell=sh

# If COLORTERM is not set, assume we're using a terminal that doesn't set it,
# rather than a terminal that doesn't support colors. This variable is checked
# by some programs (e.g. `ls` on macOS) to enable color support.
if [ -z "$COLORTERM" ]; then
    export COLORTERM="$TERM"
fi
