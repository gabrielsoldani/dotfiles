# zsh Files

## `.zshenv`

Sourced on all invocations of the shell, unless `-f` is set. It should
contain important environment variables.

## `.zshrc`

Sourced in interactive shells. It should contain most options, aliases,
keybindings, etc.

## `.zprofile`

Sourced in login shells, after `.zshenv` but before `.zshrc`. It really
shouldn't be used.
