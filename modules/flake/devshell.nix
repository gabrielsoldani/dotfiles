{ ... }:

{
  _class = "flake";

  perSystem =
    { pkgs, ... }:
    {
      devShells.default = pkgs.mkShellNoCC {
        packages = with pkgs; [
          nixfmt
          nixd
          nh
          prettier
        ];
      };
    };
}
