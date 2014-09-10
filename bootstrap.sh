#!/usr/bin/sh

# Mac OS X bootstrap
#
# This applies my personal preferred configurations for OS X.
#
# Wes Kennedy
# wes.kennedy@gmail.com
# https://github.com/whiskykilo/macbuild
#

echo "You are about to install a bazillion apps and make a bunch of changes..."
echo "This will take a freaking eternity..."

###            ###
# Setup Homebrew #
###            ###

curl -sL https://raw.githubusercontent.com/Homebrew/install/master/install | ruby
echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile
brew doctor
brew update

###         ###
# Install Git #
###         ###

brew install git

###               ###
# Install Brew Cask #
###               ###

brew install caskroom/cask/brew-cask

###          ###
# Install wget #
###          ###

brew install wget

###             ###
# Configure XCode #
###             ###

xcode-select —install

###     ###
# XQuartz #
###     ###

cd /tmp
wget http://xquartz.macosforge.org/downloads/SL/XQuartz-2.7.7.dmg
hdiutil attach XQuartz-2.7.7.dmg
sudo installer -pkg /Volumes/XQuartz-2.7.7/XQuartz.pkg -target /
hdiutil unmount /Volumes/XQuartz-2.7.7

###              ###
# Clone Repository #
###              ###

cd ${HOME}

git clone https://github.com/whiskykilo/_macbuild

###                   ###
# Prep for installation #
###                   ###

chmod a+x ${HOME}/macbuild/scripts/apps.sh
chmod a+x ${HOME}/macbuild/scripts/osx.sh

###                   ###
# Install Required Apps #
###                   ###

source ${HOME}/macbuild/scripts/apps.sh

###                   ###
# Make all the changes! #
###                   ###

source ${HOME}/macbuild/scripts/osx.sh
