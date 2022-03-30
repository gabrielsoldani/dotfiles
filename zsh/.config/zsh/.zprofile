# shellcheck shell=sh

# By default zsh doesn't source .profile.
if [ -f "$HOME/.profile" ]; then
  . "$HOME/.profile"
fi

