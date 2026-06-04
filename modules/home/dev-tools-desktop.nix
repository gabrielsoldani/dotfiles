{ pkgs, ... }:

{
  _class = "homeManager";

  programs.ghostty = {
    enable = true;
    package = if pkgs.stdenv.isDarwin then pkgs.ghostty-bin else pkgs.ghostty;
    enableBashIntegration = true;
    enableZshIntegration = true;
    settings = {
      theme = "dark:Catppuccin Frappe,light:Catppuccin Latte";
      "font-family" = [
        ""
        "Hack Nerd Font Mono"
      ];
    };
  };

  programs.ssh.settings.ghostty = {
    header = "Match exec \"test \"$TERM\" = \"xterm-ghostty\"\"";
    SetEnv.TERM = "xterm-256color";
  };

  home.packages = with pkgs; [
    # Programming font
    nerd-fonts.hack
  ];
}
