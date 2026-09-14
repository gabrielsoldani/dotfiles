{ inputs, ... }:

let
  abacaxi = {
    imports = [
      inputs.self.darwinModules.default
      inputs.self.darwinModules."1password"
    ];

    system.primaryUser = "gabriel";
    users.users.gabriel.home = "/Users/gabriel";

    system.configurationRevision = null;
    system.stateVersion = 6;

    homebrew.masApps = {
      "Microsoft Excel" = 462058435;
      "Microsoft Word" = 462054704;
      OneDrive = 823766827;
      Telegram = 747648890;
      "uBlock Origin Lite" = 6745342698;
      WhatsApp = 310633997;
    };

    homebrew.casks = [
      "balenaetcher"
      "chatgpt"
      "daisydisk"
      "discord"
      "docker-desktop"
      "dolphin"
      "firefox"
      "google-chrome"
      "iina"
      "modrinth"
      "parsec"
      "proton-mail"
      "protonvpn"
      "spotify"
      "tabula"
      "visual-studio-code"
      "zoom"
      "zotero"
    ];

    home-manager.extraSpecialArgs = { inherit inputs; };
    home-manager.users.gabriel = {
      imports = [
        inputs.self.homeModules.default
        inputs.self.homeModules."1password"
        inputs.self.homeModules.devToolsCli
        inputs.self.homeModules.devToolsDesktop
      ];

      programs.nh = {
        enable = true;
        clean = {
          enable = true;
          dates = "weekly";
          extraArgs = "--keep-one --keep 3 --keep-since 14d";
        };
      };

      programs.git.settings.user = {
        name = "Gabriel Soldani";
        email = "gabriel@gabrielsoldani.com";
      };

      home.username = "gabriel";
      home.homeDirectory = "/Users/gabriel";

      home.stateVersion = "26.05";
    };
  };

in
{
  flake.darwinConfigurations.abacaxi = inputs.nix-darwin.lib.darwinSystem {
    system = "aarch64-darwin";
    specialArgs = { inherit inputs; };
    modules = [
      inputs.home-manager.darwinModules.home-manager
      abacaxi
    ];
  };
}
