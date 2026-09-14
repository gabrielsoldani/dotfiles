{ lib, pkgs, ... }:

{
  programs.home-manager.enable = true;
  xdg.enable = true;

  programs.nh.enable = true;

  targets.darwin = lib.mkIf pkgs.stdenv.hostPlatform.isDarwin {
    defaults = {
      NSGlobalDomain = {
        AppleInterfaceStyleSwitchesAutomatically = true;
        com.apple.sound.beep.feedback = true;
        ApplePressAndHoldEnabled = false;
        KeyRepeat = 2;
        InitialKeyRepeat = 15;
        AppleKeyboardUIMode = 2;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
      };

      "com.apple.dock" = {
        autohide = true;
        wvous-br-corner = 1;
        wvous-br-modifier = 0;
      };

      "com.apple.AppleMultitouchTrackpad".Clicking = true;
      "com.apple.driver.AppleBluetoothMultitouch.trackpad".Clicking = true;

      "com.apple.desktopservices" = {
        DSDontWriteNetworkStores = true;
        DSDontWriteUSBStores = true;
      };

      "com.apple.finder" = {
        AppleShowAllFiles = true;
        FXRemoveOldTrashItems = true;
        ShowPathBar = true;
      };

      "com.apple.Safari" = {
        AutoFillPasswords = false;
        WebAutomaticSpellingCorrectionEnabled = false;
        ShowOverlayStatusBar = true;
        AutoOpenSafeDownloads = false;
        AutoFillCreditCardData = false;
      };
    };

    currentHostDefaults."com.apple.controlcenter".BatteryShowPercentage = true;
  };

  programs.zsh = {
    enable = true;
    autocd = true;
    history.share = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    setOptions = lib.mkAfter [
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

    # Auto-complete hidden files
    completionInit = lib.mkAfter ''
      _comp_options+=(globdots)
    '';
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  home.shellAliases = {
    ls = "ls --color=auto";
    grep = "grep --color=auto";
    fgrep = "fgrep --color=auto";
    egrep = "egrep --color=auto";
    ll = "ls -alF";
    la = "ls -A";
    l = "ls -CF";
    cp = "cp -iv";
    mv = "mv -iv";
    rm = "rm -iv";
    man = "batman";
  }
  // lib.optionalAttrs pkgs.stdenv.hostPlatform.isLinux {
    open = "xdg-open";
  };

  programs.bat = {
    enable = true;
    extraPackages = with pkgs.bat-extras; [ batman ];
  };

  programs.dircolors = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    settings."*" = {
      ForwardAgent = false;
      AddKeysToAgent = "no";
      Compression = false;
      ServerAliveInterval = 0;
      ServerAliveCountMax = 3;
      HashKnownHosts = false;
      UserKnownHostsFile = "~/.ssh/known_hosts";
      ControlMaster = "no";
      ControlPath = "~/.ssh/master-%r@%n:%p";
      ControlPersist = "no";
    };
  };

  programs.htop.enable = true;

  home.packages = with pkgs; [
    curl
    jq
    rsync
    tree
  ];
}
