#!/usr/bin/env bash

cd ~/prime/applications/
chmod +x *.sh

# Brew: The missing package manager for macOS
# https://github.com/Homebrew/brew
./brew.sh

# MAS: Mac App Store command line interface
# https://github.com/mas-cli/mas
./mas.sh

# Wget: a computer program that retrieves content from web servers
# https://github.com/mirror/wget
./wget.sh

# apm: Atom Package Manager
# https://github.com/atom/apm
./apm.sh

# Composer: dependency manager for PHP
# https://github.com/composer/composer
./composer.sh

# RubyGems: a package management framework for Ruby
# https://github.com/rubygems/rubygems
./gem.sh

# NPM: the package manager for JavaScript
# https://github.com/npm/cli
./npm.sh

# PIP: The PyPA recommended tool for installing Python packages
# https://github.com/pypa/pip
./pip.sh

# Yarn: fast, reliable, and secure dependency management
# https://github.com/yarnpkg/yarn
./yarn.sh
