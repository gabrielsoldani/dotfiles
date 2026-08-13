{ ... }:

{
  gabriel.personal = {
    darwin = {
      homebrew.masApps = {
        "Microsoft Excel" = 462058435;
        "Microsoft Word" = 462054704;
        OneDrive = 823766827;
        Telegram = 747648890;
        "uBlock Origin Lite" = 6745342698;
        WhatsApp = 310633997;
      };

      homebrew.casks = [
        "chatgpt"
        "daisydisk"
        "iina"
        "proton-mail"
        "protonvpn"
        "spotify"
      ];
    };

    homeManager = {
      programs.git.settings.user = {
        name = "Gabriel Soldani";
        email = "gabriel@gabrielsoldani.com";
      };
    };
  };
}
