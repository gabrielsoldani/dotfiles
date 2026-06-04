{ inputs, ... }:

{
  _class = "flake";

  imports = [ inputs.git-hooks-nix.flakeModule ];

  perSystem =
    { config, pkgs, ... }:
    {
      pre-commit.settings.hooks = {
        treefmt.enable = true;
      };

      devShells.default = pkgs.mkShellNoCC {
        shellHook = ''
          ${config.pre-commit.shellHook}
        '';

        packages =
          with pkgs;
          [
            nixfmt
            nixd
            nh
            prettier
            config.treefmt.build.wrapper
          ]
          ++ config.pre-commit.settings.enabledPackages;
      };
    };
}
