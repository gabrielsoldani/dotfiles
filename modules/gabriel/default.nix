{
  self,
  ...
}:

{
  gabriel.default = {
    darwin =
      { ... }:
      {
        nix.settings.experimental-features = [
          "nix-command"
          "flakes"
        ];

        security.pam.services.sudo_local = {
          enable = true;
          touchIdAuth = true;
        };

        home-manager = {
          backupFileExtension = "hm-backup";
          useGlobalPkgs = true;
          useUserPackages = true;
        };

        homebrew = {
          enable = true;
          enableZshIntegration = true;
          onActivation.cleanup = "zap";

          masApps.Amphetamine = 937984704;

          casks = [
            "betterdisplay"
            "scroll-reverser"
          ];
        };

        system.configurationRevision = self.rev or self.dirtyRev or null;
        system.stateVersion = 6;
      };

    homeManager =
      { lib, pkgs, ... }:
      {
        programs.home-manager.enable = true;
        xdg.enable = true;
        home.stateVersion = "26.05";

        programs.nh = {
          enable = true;
          clean = {
            enable = true;
            dates = "weekly";
            extraArgs = "--keep-one --keep 3 --keep-since 14d";
          };
        };

        targets.darwin = lib.mkIf pkgs.stdenv.isDarwin {
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
      };
  };
}
