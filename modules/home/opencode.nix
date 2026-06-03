{ ... }:

{
  programs.opencode = {
    enable = true;
    enableMcpIntegration = true;
    settings = {
      autoupdate = "notify";
    };
  };
}
