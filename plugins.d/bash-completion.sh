#!/usr/bin/env bash

# Mac OS X bash-completion
#
# Wes Kennedy
# wes.kennedy@gmail.com
# https://github.com/whiskykilo/_macbuild
#
if [ ! -f $(brew --prefix)/etc/bash_completion ]; then
brew install bash-completion
cat <<EOT >> ~/.bash_profile
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
EOT
else
  echo "bash-completion is installed"
fi
