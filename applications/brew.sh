#!/usr/bin/env bash

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Tap dependencies
brew tap homebrew/bundle
brew tap homebrew/cask-versions
brew tap homebrew/core
brew tap homebrew/services
brew tap caskroom/cask
brew tap caskroom/fonts
brew tap buo/cask-upgrade

# Install GNU core utilities (those that come with macOS are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`
brew install coreutils
# Install some other useful utilities like `sponge`
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Install Bash 4
brew install bash
brew install bash-completion2
# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install `wget`
brew install wget

# Install GPG and pinentry to enable PGP-signing commits in GitHub Desktop.
brew install gpg pinentry-mac

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen

# Install other useful binaries.
brew install autojump # A cd command that learns - easily navigate directories from the command line
brew install cmake
brew install composer # Composer - Dependency Manager for PHP
brew install ffmpeg
brew install gcc
brew install git
brew install hub # A command-line tool that makes git easier to use with GitHub.
brew install imagemagick ghostscript
brew install lynx # Text-based Web Browser
brew install mas # Mac App Store command line interface
brew install megatools
brew install n # Node version management
brew install p7zip
brew install php
brew install pup # Parsing HTML at the command line
brew install python
brew install rename # This program renames files according to modification rules specified on the command line
brew install ripgrep # ripgrep recursively searches directories for a regex pattern
brew install ruby
brew install tag # A command line tool to manipulate tags on Mac OS X files, and to query for files with those tags
brew install tree
brew install wp-cli
brew install yarn # Fast, reliable, and secure dependency management
brew install youtube-dl # Command-line program to download videos from YouTube.com and other video sites

# Install Java
# brew cask install homebrew/cask-versions/java8 # version 8
brew cask install java

# Install fonts
brew cask install font-open-sans
brew cask install font-raleway

# Quick Look plugins (https://github.com/sindresorhus/quick-look-plugins)
brew cask install qlcolorcode    # Preview source code files with syntax highlighting
brew cask install qlimagesize    # Display image size and resolution
brew cask install qlmarkdown     # Preview Markdown files
brew cask install qlvideo        # Preview most types of video files, as well as their thumbnails, cover art and metadata
brew cask install quicklook-json # Preview JSON files
brew cask install webpquicklook  # Preview WebP images

# Install GUI Apps
brew cask install audio-hijack
brew cask install authy
brew cask install bitwarden
brew cask install brave-browser
brew cask install carbon-copy-cloner
brew cask install controlplane
brew cask install crossover
brew cask install cryptomator
brew cask install dolphin
brew cask install easyfind
brew cask install firefox
brew cask install flash-player
brew cask install gemini
brew cask install ghost
brew cask install github-desktop
brew cask install grandperspective
brew cask install handbrake
brew cask install iina
brew cask install image2icon
brew cask install imageoptim
brew cask install integrity
brew cask install jdownloader
brew cask install keka
brew cask install lackeyccg
brew cask install malwarebytes
brew cask install mamp
brew cask install obs
brew cask install openemu
brew cask install paparazzi
brew cask install paragon-ntfs
brew cask install plex-media-player
brew cask install protonvpn
brew cask install qbittorrent
brew cask install spectacle
brew cask install station
brew cask install steam
brew cask install sublime-merge
brew cask install sublime-text
brew cask install teamviewer
brew cask install virtualbox && brew cask install local-by-flywheel
brew cask install xmind-zen
brew cask install yacreader

# Clean the "Cellar" removing any older versions of installed formulae and clearing old downloads
brew cleanup

# Remove all unused services
brew services cleanup

# Check for errors
brew doctor
brew cask doctor
