{ ... }:

{
  gabriel.ghostty.homeManager =
    { pkgs, ... }:
    {
      programs.ghostty = {
        enable = true;
        package = if pkgs.stdenv.hostPlatform.isDarwin then pkgs.ghostty-bin else pkgs.ghostty;
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

      # Ghostty's TERM value is not available on every remote host.
      programs.ssh.settings.ghostty = {
        header = ''Match exec "test "$TERM" = "xterm-ghostty""'';
        SetEnv.TERM = "xterm-256color";
      };

      home.packages = [ pkgs.nerd-fonts.hack ];
    };
}
