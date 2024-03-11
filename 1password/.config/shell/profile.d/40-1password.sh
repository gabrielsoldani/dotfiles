# shellcheck shell=sh

# Override the location of the agent socket.
export SSH_AUTH_SOCK="$HOME/.1password/agent.sock"

# For macOS, the agent socket is in an awkward location, so symlink it to the
# same location as on Linux.
if [ ! -e "$SSH_AUTH_SOCK" ] \
    && [ -e "$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock" ]; then
    if { mkdir -p "${SSH_AUTH_SOCK%/*}" \
        && rm -f "$SSH_AUTH_SOCK" \
        && ln -s "$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock" "$SSH_AUTH_SOCK"; } then
        echo "op: symlinked agent socket" >&2
    else
        echo "op: failed to symlink agent socket" >&2
    fi
fi
