#!/usr/bin/env bash

cd ~/prime/applications/
chmod 755 *.sh

# Brew: The missing package manager for macOS
# http://brew.sh
./brew.sh

# MAS: Mac App Store command line interface
./mas.sh

# RubyGems: a package management framework for Ruby
# https://rubygems.org
./gem.sh

# NPM: the package manager for JavaScript
# https://www.npmjs.com
./npm.sh

# PIP: The PyPA recommended tool for installing Python packages
./pip.sh