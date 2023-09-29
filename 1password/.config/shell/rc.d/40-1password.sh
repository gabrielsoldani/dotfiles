# shellcheck shell=sh

if ! { source_if_exists "${XDG_CONFIG_HOME:-$HOME/.config}/op/plugins.sh" \
    || source_if_exists "$HOME/.op/plugins.sh"; }; then
    echo "op plugins could not be loaded. You may need to run 'op plugin init'." >&2
    return 1
fi
