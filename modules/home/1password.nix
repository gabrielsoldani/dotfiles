{
  config,
  lib,
  pkgs,
  ...
}:

let
  _1passwordSshAgentSockPath =
    if pkgs.stdenv.isDarwin then
      "${config.home.homeDirectory}/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
    else
      "${config.home.homeDirectory}/.1password/agent.sock";
in
{
  _class = "homeManager";

  programs.ssh.settings."*" = {
    IdentityAgent = [
      (lib.strings.escapeShellArg _1passwordSshAgentSockPath)
    ];
  };
}
