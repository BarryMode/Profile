#!/usr/bin/env bash

cd ~/prime/applications/

# Brew - The missing package manager for macOS
# http://brew.sh
chmod 755 brew.sh
./brew.sh

# RubyGems - a package management framework for Ruby
# https://rubygems.org
chmod 755 gem.sh
./gem.sh

# NPM - the package manager for JavaScript
# https://www.npmjs.com
chmod 755 npm.sh
./npm.sh

# PIP - The PyPA recommended tool for installing Python packages
chmod 755 pip.sh
./pip.sh