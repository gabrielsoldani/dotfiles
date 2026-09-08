{ ... }:

{
  gabriel.opencode.homeManager = {
    programs.opencode = {
      enable = true;
      enableMcpIntegration = true;
      settings = {
        autoupdate = "notify";
        permission = {
          external_directory = {
            "/nix/store/**" = "allow";
          };
          edit = {
            "/nix/store/**" = "deny";
          };
        };
      };
    };
  };
}
