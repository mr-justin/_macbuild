#!/usr/bin/env bash

# Mac OS X rbenv install
#
# Wes Kennedy
# wes.kennedy@gmail.com
# https://github.com/whiskykilo/_macbuild
#


brew install rbenv
brew install ruby-build

echo "export RBENV_ROOT=/usr/local/var/rbenv" >> ~/.bash_profile


cat <<EOT >> ~/.bash_profile
if which rbenv > /dev/null; then
  eval "$(rbenv init -)";
fi
EOT
