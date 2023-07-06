# shellcheck shell=bash

# Enable programmable completions.
# NOTE: Homebrew already handles this, so skip it if Homebrew is installed.
source_if_exists "/etc/profile.d/bash_completion.sh"
