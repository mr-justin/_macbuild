#!/usr/bin/env bash

# Mac OS X dev
#
# This applies my personal preferred configurations for OS X.
#
# Wes Kennedy
# wes.kennedy@gmail.com
# https://github.com/whiskykilo/macbuild
#

brew tap homebrew/binary
brew install packer

###           ###
# Build OS X VM #
###           ###

wget
mkdir ~/src
cp /Applications/Install\ OS\ X\ Mountain\ Lion.app/Contents/SharedSupport/InstallESD.dmg ~/src
