# shellcheck shell=sh

# This variable, when and only when an interactive shell is invoked (...) shall
# be used as a pathname of a file containing shell commands to execute in the
# current environment.
# https://pubs.opengroup.org/onlinepubs/9699919799/utilities/sh.html
export ENV="$SHELLDOTDIR/rc.sh"
