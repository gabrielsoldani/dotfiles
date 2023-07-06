# shellcheck shell=sh

# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
if [ -n "$HOMEBREW_PREFIX" ]; then
    FPATH="$HOMEBREW_PREFIX/share/zsh/site-functions:${FPATH}"
else
    echo "brew is not installed" >&2
fi
