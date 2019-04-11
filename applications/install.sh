#!/usr/bin/env bash

cd ~/prime/applications/
chmod +x *.sh

# MAS - Mac App Store command line interface
# https://github.com/mas-cli/mas
./mas.sh

# Brew - The missing package manager for macOS
# https://github.com/Homebrew/brew
./brew.sh

# Wget - A computer program that retrieves content from web servers
# https://github.com/mirror/wget
./wget.sh

# Composer - Dependency Manager for PHP
# https://github.com/composer/composer
./composer.sh

# RubyGems: A package management framework for Ruby
# https://github.com/rubygems/rubygems
./gem.sh

# NPM: The package manager for JavaScript
# https://github.com/npm/cli
./npm.sh

# PIP: The PyPA recommended tool for installing Python packages
# https://github.com/pypa/pip
./pip.sh

# Yarn: Fast, reliable, and secure dependency management
# https://github.com/yarnpkg/yarn
./yarn.sh
