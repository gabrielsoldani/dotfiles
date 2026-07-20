{ ... }:

{
  _class = "homeManager";

  programs.home-manager.enable = true;

  xdg.enable = true;

  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--keep-one --keep 3 --keep-since 14d";
    };
  };
}
