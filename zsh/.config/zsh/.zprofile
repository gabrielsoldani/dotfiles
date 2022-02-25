# shellcheck shell=zsh

# By default zsh doesn't source .profile.
if [ -f "$HOME/.profile" ]; then
  . "$HOME/.profile"
fi

