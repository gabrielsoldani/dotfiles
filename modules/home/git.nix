{ lib, ... }:

{
  _class = "homeManager";

  programs.git = {
    enable = true;

    settings = {
      core = {
        # Always use LF line endings and don't perform EOL conversions.
        #
        # Even on Windows, which uses CRLF line endings by default, we want
        # LF line endings so we'll get consistent behavior when we use Git
        # through the Windows Subsystem for Linux (WSL).
        eof = "lf";
        autocrlf = "input";
      };

      init.defaultBranch = "main";

      # Automatically stash, merge and unstash.
      merge.autoStash = true;

      # Instead of merging, rebase when pulling.
      pull.rebase = true;

      # If no upstream tracking exists, push to the same branch name.
      push.autoSetupRemote = true;

      rebase = {
        # Automatically squash fixups, squashes and amends when rebasing.
        autoSquash = true;

        # Automatically stash, rebase and unstash.
        autoStash = true;

        # Report an error if commits are missing from the todo list.
        # If you want to drop a commit, be explicit and use `drop` instead.
        missingCommitsCheck = "error";
      };

      alias = {
        "root" = "rev-parse --show-toplevel";
        "stash-all" = "stash --include-untracked";
      };
    };

    ignores = [
      # macOS
      "*.DS_Store"

      # Windows
      "[Dd]esktop.ini"
    ];
  };

  home.shellAliases = {
    "g" = "git";
    "gap" = "git add -p";
    "gs" = "git status";
    "gsw" = "git switch";
    "gc" = "git commit";
    "gca" = "git commit --amend";
    "gl" = "git log";
    "glo" = "git log --oneline --decorate --graph";
    "gp" = "git pull";
    "gps" = "git push";
    "gpsf" = "git push --force-with-lease";
    "cd-gitroot" = "cd $(git root)";
  };

  # Clone repositories with just the URL.
  programs.zsh.initContent = lib.mkOrder 1100 ''
    alias -s git='git clone'
  '';
}
