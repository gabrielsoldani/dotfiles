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

ensure_file_does_not_exist() {
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
    ensure_file_does_not_exist "$HOME/.profile" || return 1

    stow -R shell || return 1

    if command_exists git; then
        git update-index --skip-worktree "shell/.profile"
    fi
}

maybe_stow_bash() {
    if ! command_exists bash; then
        return 0
    fi

    ensure_file_does_not_exist "$HOME/.bash_profile" || return 1
    ensure_file_does_not_exist "$HOME/.bashrc" || return 1

    stow -R bash || return 1
}

maybe_stow_brew() {
    if ! command_exists brew; then
        return 0
    fi

    stow -R brew || return 1
}

maybe_stow_zsh() {
    if ! command_exists zsh; then
        return 0
    fi

    ensure_file_does_not_exist "$HOME/.zshenv" || return 1
    ensure_file_does_not_exist "$HOME/.zshrc" || return 1

    stow -R zsh || return 1
}

maybe_stow_git() {
    if ! command_exists git; then
        return 0
    fi

    ensure_file_does_not_exist "$HOME/.gitconfig" || return 1

    stow -R git || return 1

    git update-index --skip-worktree "git/.gitconfig" || return 1
}

maybe_install_stow \
    && stow_shell \
    && maybe_stow_bash \
    && maybe_stow_brew \
    && maybe_stow_zsh \
    && maybe_stow_git \
    && echo "Bootstrapping complete"
