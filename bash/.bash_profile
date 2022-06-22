
# Source common shell profile
if [ -r "$HOME/.profile" ]; then
    . "$HOME/.profile"
fi

# Check if we're an interactive shell
if [[ "$-" == *i* ]]; then
    # Bash doesn't source ~/.bashrc if it's invoked as a login shell,
    # so we do it ourselves.
    if [ -r "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi
