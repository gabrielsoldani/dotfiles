# shellcheck shell=sh

if ! eval_output zoxide init zsh; then
    echo 'zoxide: failed to eval zoxide' >&2
    return 1
fi
