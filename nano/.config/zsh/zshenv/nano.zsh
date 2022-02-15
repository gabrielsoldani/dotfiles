# shellcheck shell=sh
if ! command -v nano >/dev/null 2>&1; then
    echo "nano is not installed" >&2
    return 1
fi

if [ -z "$VISUAL" ]; then
    VISUAL="$(command -v nano)"
    export VISUAL
fi

if [ -z "$EDITOR" ]; then
    EDITOR="$(command -v nano)"
    export EDITOR
fi
