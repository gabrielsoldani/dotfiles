tap "homebrew/bundle"
tap "homebrew/command-not-found"

# Core formulae
# NOTE: homebrew/core is tapped by default. There's no need to tap it.
#       Tapping it will make the script take a very long time to run.
brew "asdf"
brew "bash"
brew "bash-completion@2"
brew "clang-format"
brew "direnv"
brew "dtach"
brew "ffmpeg"
brew "gh"
brew "git"
brew "git-lfs"
brew "htop"
brew "neofetch"
brew "pandoc"
brew "rsync"
brew "shellcheck"
brew "starship"
brew "stow"
brew "tmux"
brew "tree"
brew "wget"
brew "youtube-dl"
brew "zsh"

# macOS-only formulae
brew "m4" if OS.mac?
brew "coreutils" if OS.mac?
brew "gawk" if OS.mac?
brew "gnu-sed" if OS.mac?

# Fonts
tap "homebrew/cask-fonts" if OS.mac?
tap "homebrew/linux-fonts" if OS.linux?
cask "font-hack-nerd-font"
brew "font-hack-nerd-font" if OS.linux?

# Casks
# NOTE: These are special-cased to only be installed on macOS.
#       No need for `if OS.mac?` here.
cask "1password"
cask "1password-cli"
cask "google-chrome"
cask "monitorcontrol"
cask "rectangle"
cask "scroll-reverser"
cask "spotify"
cask "visual-studio-code"
cask "zoom"

# Mac App Store apps
# NOTE: These are special-cased to only be installed on macOS.
#       No need for `if OS.mac?` here.
# NOTE: The `mas` formula is installed automatically when a `mas` entry
#       is installed.
mas "1Password for Safari", id: 1569813296
mas "Amphetamine", id: 937984704
mas "Color Picker", id: 1545870783
mas "MeetingBar", id: 1532419400
mas "Hidden Bar", id: 1452453066
mas "Speedtest", id: 1153157709
mas "WhatsApp", id: 1147396723
