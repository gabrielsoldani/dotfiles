# shellcheck shell=sh

# NOTE: This is one of the only places where we actually care about
# performance, since Homebrew takes a while to start up.
# So we avoid running `brew --prefix` if we already know the prefix,
# and we avoid running `brew shellenv` if we already have its shell
# environment set up.

# Try to use Homebrew from the PATH. If it isn't available, find it
# in common install locations.
# NOTE: As far as my understanding of the POSIX shell expansion spec
# goes, the command substitutions below shouldn't run unless needed.
HOMEBREW_PREFIX=${HOMEBREW_PREFIX:-"$(brew --prefix 2>/dev/null)"}
HOMEBREW_PREFIX=${HOMEBREW_PREFIX:-"$(/opt/homebrew/bin/brew --prefix 2>/dev/null)"}
HOMEBREW_PREFIX=${HOMEBREW_PREFIX:-"$(/usr/local/bin/brew --prefix 2>/dev/null)"}
HOMEBREW_PREFIX=${HOMEBREW_PREFIX:-"$(/home/linuxbrew/.linuxbrew/bin/brew --prefix 2>/dev/null)"}
HOMEBREW_PREFIX=${HOMEBREW_PREFIX:-"$("$HOME" --prefix 2>/dev/null)"}

# If we know where Homebrew is installed, but we don't have its shell
# environment set up yet, set it up.
if [ -n "$HOMEBREW_PREFIX" ] \
    && [ -z "$HOMEBREW_CELLAR" ] \
    && [ -z "$HOMEBREW_REPOSITORY" ] \
    && ! eval_output "$HOMEBREW_PREFIX/bin/brew" "shellenv"; then
    echo "brew: failed to set up shell environment" >&2
    return 1
fi

# By now we either have Homebrew's shell environment set up, or we can't
# tell where it's installed.
if [ -z "$HOMEBREW_PREFIX" ]; then
    echo "brew is not installed" >&2
    return 1
fi
