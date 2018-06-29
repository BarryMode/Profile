#!/usr/bin/env bash

cd ~/prime/applications/
chmod 755 *.sh

# Brew: The missing package manager for macOS
# https://brew.sh
./brew.sh

# MAS: Mac App Store command line interface
# https://github.com/mas-cli/mas
./mas.sh

# Wget: a computer program that retrieves content from web servers
./wget.sh

# Composer: dependency manager for PHP
# https://getcomposer.org
./composer.sh

# RubyGems: a package management framework for Ruby
# https://rubygems.org
./gem.sh

# NPM: the package manager for JavaScript
# https://www.npmjs.com
./npm.sh

# PIP: The PyPA recommended tool for installing Python packages
# https://pypi.python.org/pypi/pip
./pip.sh

# Yarn: fast, reliable, and secure dependency management
# https://yarnpkg.com/en/
./yarn.sh