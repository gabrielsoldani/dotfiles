{ lib, pkgs, ... }:

{
  _class = "homeManager";

  home.packages =
    with pkgs;
    [
      protonmail-desktop
      spotify
    ]
    ++ lib.optionals stdenv.hostPlatform.isDarwin [
      daisydisk
      iina
    ];

  programs.git = {
    settings = {
      user.name = "Gabriel Soldani";
      user.email = "gabriel@gabrielsoldani.com";
    };
  };
}
