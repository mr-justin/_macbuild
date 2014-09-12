#!/usr/bin/env bash

# Mac OS X bash-completion
#
# Wes Kennedy
# wes.kennedy@gmail.com
# https://github.com/whiskykilo/_macbuild
#
if [[ ! -f /Applications/GitHub.app ]]; then
  cd /tmp
  wget https://github-central.s3.amazonaws.com/mac/GitHub%20for%20Mac%20186.zip
  unzip "GitHub\ for\ Mac\ 186.zip"
  mv GitHub.app /Applications/
else
  echo "GitHub for Mac is already installed."
fi
