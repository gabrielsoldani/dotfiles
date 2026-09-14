{
  config,
  lib,
  pkgs,
  ...
}:
let
  sshAgentSocket =
    if pkgs.stdenv.hostPlatform.isDarwin then
      "${config.home.homeDirectory}/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
    else
      "${config.home.homeDirectory}/.1password/agent.sock";
in
{
  programs.ssh.settings."*".IdentityAgent = [
    (lib.strings.escapeShellArg sshAgentSocket)
  ];
}
