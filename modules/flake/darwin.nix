{ ... }:

{
  flake.darwinModules = {
    default = import ../darwin/default.nix;
    "1password" = import ../darwin/1password.nix;
  };
}
