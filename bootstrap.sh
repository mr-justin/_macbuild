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

sudo -v

###                           ###
# Put default dotfiles in place #
###                           ###

rm ${HOME}/.bash_profile
cp ${HOME}/_macbuild/dotfiles/.bash_profile ${HOME}/
mkdir ${HOME}/.ssh
cp ${HOME}/_macbuild/dotfiles/ssh/config ${HOME}/.ssh/

###             ###
# Configure XCode #
###             ###

xcode-select --install

while [ ! -d /Library/Developer/CommandLineTools ]
do
  sleep 2
done

sleep 45
###            ###
# Setup Homebrew #
###            ###

sudo mkdir -p /usr/local
cd /usr/local
sudo chown -R ${USER}:admin /usr/local
sudo chmod -R 755 /usr/local

curl -L https://github.com/Homebrew/homebrew/tarball/master | tar xz --strip 1 -C /usr/local

echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile
brew doctor
brew update


###               ###
# Install Brew Cask #
###               ###

brew install caskroom/cask/brew-cask

###          ###
# Install wget #
###          ###

brew install wget

###              ###
# brew install git #
###              ###

brew install git

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

chmod a+x ${HOME}/_macbuild/scripts/apps.sh
chmod a+x ${HOME}/_macbuild/scripts/osx.sh

###                   ###
# Install Required Apps #
###                   ###

source ${HOME}/_macbuild/scripts/apps.sh

###                   ###
# Make all the changes! #
###                   ###

source ${HOME}/_macbuild/scripts/osx.sh

###                   ###
# Build dev environment #
###                   ###

source ${HOME}/_macbuild/scripts/dev.sh
