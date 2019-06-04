#!/usr/bin/env bash

#=====================================#
#  HOMEBREW
#=====================================#
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update && brew upgrade

#=====================================#
#  TAPS
#=====================================#
brew tap homebrew/bundle
brew tap homebrew/cask-fonts
brew tap homebrew/cask-versions
brew tap homebrew/core
brew tap homebrew/services

#=====================================#
#  BASH
#=====================================#
brew install bash
brew install bash-completion@2
# Switch to using brew-installed bash as default shell
BREW_PREFIX=$(brew --prefix) # Homebrew's installed location
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

#=====================================#
#  GNU TOOLS
#=====================================#
brew install coreutils # Install GNU core utilities (those that come with macOS are outdated)
brew install moreutils # Install some other useful utilities like `sponge`
brew install findutils # Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew install gnu-sed   # Install GNU `sed`, overwriting the built-in `sed`

#=====================================#
#  MACOS TOOLS
#=====================================#
brew install vim
brew install grep
brew install openssh
brew install screen

#=====================================#
#  OTHER BINARIES
#=====================================#
brew install autojump # A cd command that learns - easily navigate directories from the command line
brew install awk
brew install cmake
brew install cmatrix # matrix movie style green text
brew install composer # Composer - Dependency Manager for PHP
brew install deno # A secure JavaScript/TypeScript runtime built with V8, Rust, and Tokio
brew install exiftool
brew install ffmpeg
brew install gcc
brew install git
brew install gpg pinentry-mac # Install GPG and pinentry to enable PGP-signing commits in GitHub Desktop
brew install hub # A command-line tool that makes git easier to use with GitHub.
brew install imagemagick ghostscript
brew install lynx # Text-based Web Browser
brew install mas # Mac App Store command line interface
brew install megatools

# mySQL 8 does not work out of the box. You have to manually set a password even if it's blank. Here's how:
# 1. mysqld_safe --skip-grant-tables &
# 2. use mysql;
# 3. UPDATE user SET authentication_string='' WHERE user='root';
brew install mysql

brew install node
brew install p7zip
brew install php
brew install pup # Parsing HTML at the command line
brew install python
brew install rename # This program renames files according to modification rules specified on the command line
brew install ripgrep # ripgrep recursively searches directories for a regex pattern
brew install ruby
brew install tag # A command line tool to manipulate tags on Mac OS X files, and to query for files with those tags
brew install tree
brew install wget
brew install wp-cli
brew install yarn # Fast, reliable, and secure dependency management
brew install youtube-dl # Command-line program to download videos from YouTube.com and other video sites

#=====================================#
#  FONTS
#=====================================#
brew cask install font-open-sans
brew cask install font-raleway

#=====================================#
#  QUICKLOOK PLUGINS
#=====================================#
brew cask install qlcolorcode    # Preview source code files with syntax highlighting
brew cask install qlimagesize    # Display image size and resolution
brew cask install qlmarkdown     # Preview Markdown files
brew cask install qlvideo        # Preview most types of video files, as well as their thumbnails, cover art and metadata
brew cask install quicklook-json # Preview JSON files

#=====================================#
#  APPS
#=====================================#
brew cask install audio-hijack
brew cask install authy
brew cask install bitwarden
brew cask install brave-browser
brew cask install carbon-copy-cloner
brew cask install controlplane
brew cask install crossover
brew cask install discord
brew cask install dolphin
brew cask install easyfind
brew cask install firefox
brew cask install flash-player
brew cask install gemini
brew cask install ghost
brew cask install github-desktop
brew cask install grandperspective
brew cask install handbrake
brew cask install hex-fiend
brew cask install iina
brew cask install image2icon
brew cask install imageoptim
brew cask install integrity
brew cask install java
brew cask install jdownloader
brew cask install keka
brew cask install keybase
brew cask install lackeyccg
brew cask install malwarebytes
brew cask install megasync
brew cask install obs
brew cask install openemu
brew cask install paparazzi
brew cask install paragon-ntfs
brew cask install plex-media-player
brew cask install protonvpn
brew cask install station
brew cask install steam
brew cask install sublime-text
brew cask install teamviewer
brew cask install telegram
brew cask install vanilla
brew cask install virtualbox && brew cask install local-by-flywheel
brew cask install vlc
brew cask install webtorrent
brew cask install xmind-zen
brew cask install yacreader

#=====================================#
#  HOMEBREW MAINTENANCE
#=====================================#
brew cleanup && brew services cleanup
brew doctor && brew cask doctor
