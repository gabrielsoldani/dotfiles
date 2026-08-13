{ den, ... }:

{
  gabriel.claude-code = {
    includes = [ (den.batteries.unfree [ "claude-code" ]) ];

    homeManager = {
      programs.claude-code = {
        enable = true;
        enableMcpIntegration = true;
      };

      programs.git.ignores = [
        ".claude/settings.local.json"
        ".claude/CLAUDE.local.md"
        "CLAUDE.local.md"
      ];
    };
  };
}
