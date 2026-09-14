{ ... }:

{
  flake.homeModules = {
    default = import ../home/default.nix;
    "1password" = import ../home/1password.nix;
    devToolsCli = import ../home/dev-tools-cli.nix;
    devToolsDesktop = import ../home/dev-tools-desktop.nix;
  };
}
