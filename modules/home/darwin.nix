{ ... }:

{
  _class = "homeManager";

  targets.darwin.defaults = {
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

      # Hot Corners
      wvous-br-corner = 1;
      wvous-br-modifier = 0;
    };

    # Tap to click
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

  targets.darwin.currentHostDefaults = {
    "com.apple.controlcenter" = {
      BatteryShowPercentage = true;
    };
  };
}
