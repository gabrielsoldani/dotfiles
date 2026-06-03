{ lib, pkgs, ... }:

{
  _class = "homeManager";

  programs.zsh = {
    enable = true;

    autocd = true;
    history.share = true;

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    setOptions = [
      ###
      # Completion
      ###

      # Always move the cursor to the end of the word when a full completion
      # is inserted.
      "alwaystoend"

      # Don't insert the first match immediately on ambiguous completion.
      "nomenucomplete"

      # Automatically use menu completion after the second consecutive request
      # for completion, for example by pressing the tab key repeatedly
      "automenu"

      # Complete from both ends of the word.
      "completeinword"

      ###
      # Expansion and Globbing
      ###

      # If a pattern for filename generation has no matches, print an error,
      # instead of leaving it unchanged in the argument list.
      "nomatch"

      ###
      # Input/Output
      ###

      # Disable output flow control via start/stop characters (usually
      # assigned to ^S/^Q) in the shell’s editor.
      "noflowcontrol"

      # Allow comments even in interactive shells.
      "interactivecomments"

      ###
      # Zle
      ###

      # Don't beep.
      "nobeep"
    ];

    completionInit = lib.mkAfter ''
      # Auto-complete hidden files
      _comp_options+=(globdots)
    '';
  };

  programs.starship.enable = true;
  programs.starship.enableZshIntegration = true;

  # Common shell ergonomics.
  home.shellAliases = {
    # Use color by default where supported.
    ls = "ls --color=auto";
    grep = "grep --color=auto";
    fgrep = "fgrep --color=auto";
    egrep = "egrep --color=auto";

    # Handy directory listings.
    ll = "ls -alF";
    la = "ls -A";
    l = "ls -CF";

    # Ask before overwriting and be verbose about which files are affected.
    cp = "cp -iv";
    mv = "mv -iv";
    rm = "rm -iv";

    man = "batman";
  }
  // lib.optionalAttrs pkgs.stdenv.isLinux {
    # Linux desktops have xdg-open; Darwin already has `open`.
    open = "xdg-open";
  };

  programs.bat = {
    enable = true;
    extraPackages = with pkgs.bat-extras; [
      batman
    ];
  };

  programs.dircolors = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  home.packages = with pkgs; [
    htop
    rsync
    tree
  ];
}
