#!/usr/bin/env bash

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Tap so you don't have to think about it
brew tap homebrew/bundle
brew tap homebrew/core
brew tap homebrew/services
brew tap homebrew/versions

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

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
brew install homebrew/php/php56 --with-gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install other useful binaries.
brew install ack
brew install ffmpeg
brew install gcc
brew install git
brew install gpg pinentry-mac
brew install imagemagick --with-webp
brew install ghostscript
brew install node
brew install p7zip
brew install qt5
brew install rename
brew install ssh-copy-id
brew install testssl
brew install tree
brew install webkit2png

# Enter the Caskroom
brew tap caskroom/cask

# Install Java
brew cask install java

# Markdown support for Quick Look
brew cask install qlmarkdown
# Video support for Quick Look
brew cask install qlvideo

# Install GUI Apps
brew cask install audio-hijack
brew cask install carbon-copy-cloner
brew cask install cleanmymac
brew cask install controlplane
brew cask install crossover
brew cask install cryptomator
brew cask install cyberduck
brew cask install discord
brew cask install disk-drill
brew cask install dolphin
brew cask install dropbox
brew cask install easyfind
brew cask install electron
brew cask install filebot # this is CLI only
brew cask install firefox
brew cask install flash-player
brew cask install gemini
brew cask install ghost
brew cask install github-desktop
brew cask install google-backup-and-sync
brew cask install handbrake
brew cask install jdownloader
brew cask install keybase
brew cask install malwarebytes-anti-malware
brew cask install mamp
brew cask install mountain-duck
brew cask install lackeyccg
brew cask install obs
brew cask install openemu
brew cask install paparazzi
brew cask install paragon-ntfs
brew cask install qbittorrent
brew cask install sequel-pro
brew cask install slack
brew cask install steam
brew cask install sublime-text
brew cask install teamviewer
brew cask install the-unarchiver
brew cask install tunnelbear
brew cask install vlc
brew cask install yacreader

# Remove outdated versions from the cellar.
brew cleanup
brew cask cleanup

# Create symlinks for unlinked apps
brew linkapps

# Recreate all symlinks, add --force to also process keg-only formula
# brew list -1 | while read line; do brew unlink $line; brew link $line; done

# Check for errors
brew doctor