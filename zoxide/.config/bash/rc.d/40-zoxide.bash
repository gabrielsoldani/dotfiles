# shellcheck shell=bash

if ! eval_output zoxide init bash; then
    echo "zoxide: failed to eval zoxide" >&2
    return 1
fi
