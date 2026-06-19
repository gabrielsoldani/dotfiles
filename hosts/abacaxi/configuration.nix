{
  lib,
  pkgs,
  self,
  ...
}:

{
  _class = "darwin";

  imports = [
    ../../modules/darwin/base.nix
    ../../modules/darwin/personal.nix
  ];

  system.primaryUser = "gabriel";

  users.users.gabriel = {
    home = "/Users/gabriel";
    shell = pkgs.zsh;
  };

  home-manager.users.gabriel = {
    imports = [
      ../../modules/home/base.nix
      ../../modules/home/personal.nix
      ../../modules/home/1password.nix
      ../../modules/home/claude-code.nix
      ../../modules/home/darwin.nix
      ../../modules/home/dev-tools.nix
      ../../modules/home/dev-tools-desktop.nix
      ../../modules/home/git.nix
      ../../modules/home/nix-index.nix
      ../../modules/home/opencode.nix
      ../../modules/home/shell.nix
    ];

    home.username = "gabriel";
    home.homeDirectory = "/Users/gabriel";
    home.stateVersion = "26.05";
  };

  nixpkgs.hostPlatform = "aarch64-darwin";

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "claude-code"
    ];

  system.configurationRevision = self.rev or self.dirtyRev or null;

  homebrew.casks = [
    "balenaetcher"
    "discord"
    "docker-desktop"
    "dolphin"
    "parsec"
    "zoom"
    "zotero"
    "tabula"
  ];

  system.stateVersion = 6;
}
