# shellcheck shell=sh

if [ -n "$HOMEBREW_PREFIX" ] \
    && [ -f "$HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh" ]; then
    ASDF_DIR="$HOMEBREW_PREFIX/opt/asdf/libexec"
elif [ -f "$HOME/.asdf/asdf.sh" ]; then
    ASDF_DIR="$HOME/.asdf"
fi

if [ -z "$ASDF_DIR" ]; then
    echo "asdf is not installed" >&2
    return 1
fi

# We want asdf to be in the front of the PATH.
# https://asdf-vm.com/manage/configuration.html#asdf-force-prepend
export ASDF_FORCE_PREPEND=yes

export ASDF_DIR
. "$ASDF_DIR/asdf.sh"
