{ den, gabriel, ... }:

{
  den.hosts.aarch64-darwin.abacaxi.users.gabriel.classes = [ "homeManager" ];

  den.aspects.abacaxi = {
    includes = [
      gabriel.default
      gabriel."1password"
      gabriel.browsers.chrome
      gabriel.browsers.firefox
      gabriel.claude-code
      gabriel.direnv
      gabriel.git
      gabriel.ghostty
      gabriel.nix-index
      gabriel.opencode
      gabriel.personal
      gabriel.shell
      gabriel.ssh
      gabriel.vscode
    ];

    darwin = {
      homebrew.casks = [
        "balenaetcher"
        "discord"
        "docker-desktop"
        "dolphin"
        "modrinth"
        "parsec"
        "zoom"
        "zotero"
        "tabula"
      ];

    };

    provides.gabriel.includes = [ den.batteries.primary-user ];
  };
}
