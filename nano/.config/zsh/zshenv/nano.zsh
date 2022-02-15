# shellcheck shell=sh
if ! command -v nano >/dev/null 2>&1; then
    echo "nano is not installed" >&2
    exit 1
fi

if [ -z "$VISUAL" ]; then
    export VISUAL="$(command -v nano)"
fi

if [ -z "$EDITOR" ]; then
    export EDITOR="$(command -v nano)"
fi
