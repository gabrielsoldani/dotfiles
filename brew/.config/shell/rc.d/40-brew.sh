# shellcheck shell=sh

HB_CNF_HANDLER="$(brew --repository)/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"
if [ -f "$HB_CNF_HANDLER" ]; then
    . "$HB_CNF_HANDLER"
else
    echo "homebrew-command-not-found is not installed" >&2
    return 1
fi
