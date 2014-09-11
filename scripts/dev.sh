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

mkdir -p ~/vms/packer
cd ~/vms/packer
git clone https://github.com/joefitzgerald/packer-windows.git
###           ###
# Build OS X VM #
###           ###

#wget
#cp /Applications/Install\ OS\ X\ Mountain\ Lion.app/Contents/SharedSupport/InstallESD.dmg ~/vms/isos/
