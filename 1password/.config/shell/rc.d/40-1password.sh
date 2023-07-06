# shellcheck shell=sh

if ! { . "${XDG_CONFIG_HOME:-$HOME/.config}/op/plugins.sh" \
    || . "$HOME/.op/plugins.sh"; }; then
    echo "op not installed" >&2
    return 1
fi
