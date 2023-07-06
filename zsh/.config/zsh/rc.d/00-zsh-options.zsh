# shellcheck disable=SC3000-SC4000

###
# Changing directories
###

# If a command is issued that can’t be executed as a normal command, and
# the command is the name of a directory, perform the cd command to that
# directory.
setopt autocd

###
# Completion
###

# Always move the cursor to the end of the word when a full completion
# is inserted.
setopt alwaystoend

# Don't insert the first match immediately on ambiguous completion.
setopt nomenucomplete

# Automatically use menu completion after the second consecutive request
# for completion, for example by pressing the tab key repeatedly
setopt automenu

# Complete from both ends of the word.
setopt completeinword

###
# Expansion and Globbing
###

# Treat the ‘#’, ‘~’ and ‘^’ characters as part of patterns for filename
# generation, etc. (An initial unquoted ‘~’ always produces named
# directory expansion.)
setopt extendedglob

# If a pattern for filename generation has no matches, print an error,
# instead of leaving it unchanged in the argument list.
setopt nomatch

###
# History
###

# shellcheck disable=SC2034
HISTFILE="$HOME/.histfile"
# shellcheck disable=SC2034
HISTSIZE=10000
# shellcheck disable=SC2034
SAVEHIST=10000

# Import new commands from the history file, and also appends commands
# to the history file immediately, rather than on session exit.
setopt sharehistory

###
# Input/Output
###

# Disable output flow control via start/stop characters (usually
# assigned to ^S/^Q) in the shell’s editor.
setopt noflowcontrol

# Allow comments even in interactive shells.
setopt interactivecomments

###
# Zle
###

# Don't beep.
unsetopt beep

###
