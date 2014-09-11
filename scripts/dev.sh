#!/usr/bin/env bash

# Mac OS X Development Apps
#
# Wes Kennedy
# wes.kennedy@gmail.com
# https://github.com/whiskykilo/_macbuild
#

echo "Installing Packer"

brew tap homebrew/binary
brew install packer
mkdir -p ~/dev/packer
cd ~/dev/packer
git clone https://github.com/joefitzgerald/packer-windows.git

###           ###
# Build OS X VM #
###           ###

#wget
#cp /Applications/Install\ OS\ X\ Mountain\ Lion.app/Contents/SharedSupport/InstallESD.dmg ~/vms/isos/
