{ inputs, ... }:
{
  _class = "flake";

  imports = [ inputs.treefmt-nix.flakeModule ];

  perSystem =
    { ... }:
    {
      treefmt = {
        projectRootFile = "flake.nix";

        settings.global.excludes = [
          "*.lock"
        ];

        programs.deadnix.enable = true;
        programs.nixfmt.enable = true;

        programs.prettier.enable = true;

        programs.shellcheck.enable = true;
      };
    };
}
