# shellcheck shell=sh

HOMEBREW_COMMAND_NOT_FOUND_HANDLER="$(brew --repository)/Library/Homebrew/command-not-found/handler.sh"
if [ -f "$HOMEBREW_COMMAND_NOT_FOUND_HANDLER" ]; then
    . "$HOMEBREW_COMMAND_NOT_FOUND_HANDLER"
else
    echo "homebrew-command-not-found is not installed" >&2
    return 1
fi
