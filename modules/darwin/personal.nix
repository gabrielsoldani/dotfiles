{ ... }:

{
  _class = "darwin";

  homebrew.masApps = {
    "1Password for Safari" = 1569813296;

    "Microsoft Excel" = 462058435;
    "Microsoft Word" = 462054704;
    "OneDrive" = 823766827;

    "Telegram" = 747648890;
    "uBlock Origin Lite" = 6745342698;
    "WhatsApp" = 310633997;
  };

  homebrew.casks = [
    # Password manager that keeps all passwords secure behind one password
    "1password"

    # Command-line interface for 1Password
    "1password-cli"

    # OpenAI's official ChatGPT desktop app
    "chatgpt"

    # VPN client focusing on security
    "protonvpn"
  ];
}
