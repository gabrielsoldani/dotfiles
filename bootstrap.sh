#!/bin/sh
set -e

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Only run sudo if we're not root.
as_root() {
    if [ "$(id -u)" -ne "0" ]; then
        command sudo "$@"
    else
        "$@"
    fi
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

install_packages() {
    # Try to initialize Homebrew. This is useful if this script runs
    # just after installing Homebrew, but before Homebrew's dotfiles
    # are stow'd, so running `brew` will fail.
    . "brew/.config/shell/brew/profile" 2>/dev/null

    if command_exists winget.exe; then
        echo "Installing packages using winget..."
        if ! winget.exe import -i winget-packages.jsonc \
             --accept-package-agreements --accept-source-agreements; then
            echo "winget could not install all packages." >&2
            return 1
        fi
        echo "Successfully installed packages."
    fi

    if command_exists brew; then
        echo "Installing packages using Homebrew..."
        if ! { brew update && brew bundle --file=Brewfile; } then
            echo "Homebrew could not install all packages." >&2
            return 1
        fi
    elif command_exists apt-get; then
        echo "Installing packages using apt-get..."
        if ! { as_root apt-get update \
            && as_root xargs -a apt-packages.txt apt-get install -y; } then
            echo "apt could not install all packages." >&2
            return 1
        fi
    elif command_exists apk; then
        echo "Installing packages using apk..."
        if ! { as_root apk update \
            && as_root xargs -a apk-packages.txt apk -v add; } then
            echo "apk could not install all packages." >&2
            return 1
        fi
    else
        echo "No package manager found" >&2
        return 1
    fi
    echo "Successfully installed packages."
}

stow_shell() {
    ensure_file_does_not_exist "$HOME/.profile"

    stow -R shell

    if command_exists git; then
        git update-index --skip-worktree "shell/.profile"
    fi
}

maybe_stow_bash() {
    if ! command_exists bash; then
        return 0
    fi

    ensure_file_does_not_exist "$HOME/.bash_profile"
    ensure_file_does_not_exist "$HOME/.bashrc"

    stow -R bash
}

maybe_stow_brew() {
    if ! command_exists brew; then
        return 0
    fi

    stow -R brew
}

maybe_stow_starship() {
    if ! command_exists starship; then
        return 0
    fi

    stow -R starship
}

maybe_stow_zsh() {
    if ! command_exists zsh; then
        return 0
    fi

    ensure_file_does_not_exist "$HOME/.zshenv"
    ensure_file_does_not_exist "$HOME/.zshrc"

    stow -R zsh
}

maybe_stow_git() {
    if ! command_exists git; then
        return 0
    fi

    ensure_file_does_not_exist "$HOME/.gitconfig"

    stow -R git

    git update-index --skip-worktree "git/.gitconfig"
}

install_packages
stow_shell

maybe_stow_bash
maybe_stow_brew
maybe_stow_starship
maybe_stow_zsh
maybe_stow_git

echo "Bootstrapping complete"
