# Gabriel Soldani's dotfiles

This repository contains my Nix flake-based macOS configuration, built with `nix-darwin` and Home Manager.

## What this repo does

- Manages macOS system settings with `nix-darwin`
- Manages user packages and dotfiles with Home Manager

## Prerequisites

You need Nix with flakes enabled.

## Development shell

Start in the dev shell when working on this repo:

```text
nix develop
```

If you use `direnv`, allow this repository once and it will load the dev shell automatically when you enter it:

```text
direnv allow
```

## Apply the configuration

By default, use the current machine hostname:

```text
nh darwin switch .
```

If you want to target a different host explicitly, set it with `-H`:

```text
nh darwin switch . -H abacaxi
```

## New machines

When setting up a new machine, create a new configuration under `hosts/<hostname>/` rather than folding it into an existing host.

In practice that means adding:

```text
hosts/<hostname>/flake-module.nix
hosts/<hostname>/configuration.nix
```

and importing that host module from `flake.nix`.

## Update inputs

From the repository root, update flake inputs with:

```text
nix flake update
```

Then apply the updated configuration again:

```text
nh darwin switch .
```

## Formatting and checks

Common commands:

```text
nix fmt
nix flake check
```
