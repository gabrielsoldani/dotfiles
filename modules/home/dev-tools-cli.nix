{ lib, ... }:

{
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.git = {
    enable = true;

    settings = {
      core = {
        # Always use LF line endings and don't perform EOL conversions.
        eof = "lf";
        autocrlf = "input";
      };

      init.defaultBranch = "main";
      merge.autoStash = true;
      pull.rebase = true;
      push.autoSetupRemote = true;

      rebase = {
        autoSquash = true;
        autoStash = true;
        missingCommitsCheck = "error";
      };

      alias = {
        root = "rev-parse --show-toplevel";
        stash-all = "stash --include-untracked";
      };
    };

    ignores = [
      "*.DS_Store"
      "[Dd]esktop.ini"
    ];
  };

  home.shellAliases = {
    g = "git";
    gap = "git add -p";
    gs = "git status";
    gsw = "git switch";
    gc = "git commit";
    gca = "git commit --amend";
    gl = "git log";
    glo = "git log --oneline --decorate --graph";
    gp = "git pull";
    gps = "git push";
    gpsf = "git push --force-with-lease";
    cd-gitroot = "cd $(git root)";
  };

  # Clone repositories with just the URL.
  programs.zsh.initContent = lib.mkOrder 1100 ''
    alias -s git='git clone'
  '';

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
}
