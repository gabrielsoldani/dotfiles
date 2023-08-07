# shellcheck shell=sh
if ! { . "$HOME/Library/Preferences/netlify/helper/path.zsh.inc" 2>/dev/null \
    || . "${XDG_CONFIG_HOME:-$HOME/.config}/netlify/helper/path.zsh.inc" 2>/dev/null; } then
    echo "netlify: failed to load helper functions" >&2
    return 1
fi
