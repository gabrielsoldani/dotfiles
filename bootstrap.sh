#!/bin/sh

command_exists() {
    command -v "$1" >/dev/null 2>&1
}


# Install packages using the available package manager. Homebrew is
# preferred.
needs_update=true
install_package() {
    # Try to initialize Homebrew. This is useful if this script runs
    # just after installing Homebrew, but before Homebrew's dotfiles
    # are stow'd.
    . "brew/.config/shell/brew/profile"

    if command_exists brew; then
        [ "$needs_update" = true ] && brew update && needs_update=false
        brew install "$@"
    elif command_exists apt-get; then
        [ "$needs_update" = true ] && sudo apt-get update && needs_update=false
        sudo apt-get install -y "$@"
    else
        echo "No package manager found" >&2
        return 1
    fi
}


# Install stow if isn't already installed.
maybe_install_stow() {
    if command_exists stow; then
        return 0
    fi

    install_package stow

    command_exists stow
}

move_if_needed() {
    if [ ! -f "$1" ] || [ -L "$1" ]; then
        return 0
    fi

    if mv "$1" "$1.bak"; then
        echo "moved '$1' -> '$1.bak'"
        return 0
    fi

    echo "'$1' could not be moved" >&2
    return 1
}

stow_shell() {
    move_if_needed "$HOME/.profile" || return 1

    stow -R shell

    git update-index --skip-worktree "shell/.profile"
}

maybe_stow_bash() {
    if ! command_exists bash; then
        return 0
    fi

    move_if_needed "$HOME/.bash_profile" || return 1
    move_if_needed "$HOME/.bashrc" || return 1

    stow -R bash
}

maybe_stow_brew() {
    if ! command_exists brew; then
        return 0
    fi

    stow -R brew
}

maybe_stow_zsh() {
    if ! command_exists zsh; then
        return 0
    fi

    move_if_needed "$HOME/.zshenv" || return 1
    move_if_needed "$HOME/.zshrc" || return 1

    stow -R zsh
}

maybe_install_stow \
    && stow_shell \
    && maybe_stow_bash \
    && maybe_stow_brew \
    && maybe_stow_zsh
