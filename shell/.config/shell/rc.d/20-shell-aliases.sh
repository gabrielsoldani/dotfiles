# shellcheck shell=sh

# Enable colors.
# FIXME: How portable is this?
alias ls="ls --color=auto"
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Handy `ls` aliases.
# FIXME: How portable are these?
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"

# Always be verbose and print which files were affected and, before overwriting
# or replacing a file, ask for confirmation.
# NOTE: The verbosity flag (-v) is not defined by POSIX.
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -iv"

# Open a file or URL using the default application.
if { ! has open; } && has xdg-open; then
    alias open="xdg-open"
fi
