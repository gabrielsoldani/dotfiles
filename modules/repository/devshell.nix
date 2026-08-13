{ den, inputs, ... }:

{
  imports = [ inputs.git-hooks-nix.flakeModule ];

  den.schema.flake-parts.includes = [ den.aspects.devshell ];

  den.aspects.devshell.flake-parts =
    { config, pkgs, ... }:
    {
      pre-commit.settings.hooks.treefmt.enable = true;

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
