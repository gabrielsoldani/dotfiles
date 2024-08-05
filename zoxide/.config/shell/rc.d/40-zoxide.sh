# shellcheck shell=sh

if [ -n "${BASH_VERSION:-}" ] || [ -n "$ZSH_VERSION" ]; then
    # Use shell-specific init script instead.
    return 0
fi

if ! eval_output zoxide init posix --hook prompt; then
    echo "zoxide: failed to eval zoxide" >&2
    return 1
fi

return 0
