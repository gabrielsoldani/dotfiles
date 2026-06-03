{ ... }:

{
  programs.zsh.enable = true;

  home-manager = {
    backupFileExtension = "hm-backup";
    useGlobalPkgs = true;
    useUserPackages = true;
  };
}
