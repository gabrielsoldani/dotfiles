# Gabriel Soldani's dotfiles

## Design

### Goals

- [x] Easy to set up
- [x] Works on macOS and Linux
- [x] Works with different shells
- [x] Keeps the `$HOME` clean and tidy

### Anti-goals

- [ ] Uses a templating system
- [ ] Manages secrets
- [ ] Obsesses over shell script performance

## Prerequisites

### On macOS

- [brew](https://brew.sh/#install)
- GNU Stow

  ```text
  brew install stow
  ```

### On Linux

- GNU Stow

## Usage

First of all, make sure you've cloned this repository to `$HOME/dotfiles`. This can be done with:

```text
git clone https://github.com/gabrielsoldani/dotfiles "$HOME/dotfiles"
```

Every immediate child directory in this repository is a Stow package.
They're named after the software you're probably looking to configure.
For example, the dotfiles for `zsh` are in `./zsh`.
This isn't always the software the dotfiles apply to:
For example, `apple-emoji-linux` contains `fontconfig` dotfiles you need to use `apple-emoji-linux`, and `gh` contains `git` dotfiles to make `git` use it as a credential provider.

To apply the package `package`, run:

```text
stow package
```

To unapply the package `package`, run:

```text
stow -D package
```

To reapply the package `package`, run:

```text
stow -R package
```
