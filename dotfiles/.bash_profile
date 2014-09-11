export PS1="\[\e[36;1m\]\u@ \[\e[32;1m\]\h:\w\[\e[0m\]> "
shopt -s histappend

alias ls='ls -hFG'                # classify files in colour 
alias ll='ls -l'                  # long list
alias df='df -h'                  # df human readable
alias du='du -h'                  # du human readable
alias sandbox='cd ~/Dropbox/sandbox'

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export RBENV_ROOT=/usr/local/var/rbenv

if which rbenv > /dev/null; then
  eval "$(rbenv init -)";
fi
