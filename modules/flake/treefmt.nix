{ inputs, ... }:
{
  _class = "flake";

  imports = [ inputs.treefmt-nix.flakeModule ];

  perSystem =
    { ... }:
    {
      treefmt = {
        # git-hooks-nix already adds a check that runs treefmt
        flakeCheck = false;

        projectRootFile = "flake.nix";

        settings.global.excludes = [
          "*.lock"
        ];

        programs.deadnix.enable = true;
        programs.nixfmt.enable = true;

        programs.actionlint.enable = true;

        programs.prettier.enable = true;

        programs.shellcheck.enable = true;
      };
    };
}
