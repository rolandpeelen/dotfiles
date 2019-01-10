#lis Path to your oh-my-zsh installation.
export ZSH=/Users/Roland/.oh-my-zsh

ZSH_THEME="agnoster"

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd/mm/yyyy"

# Plugins
plugins=(git osx yarn sublime)
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
source $ZSH/oh-my-zsh.sh
export EDITOR="vim"

# Aliasses
alias gitFolder="cd ~/Git"
alias cl="clear"
alias ll="ls -lsa"
alias git fuck="git reset head --hard"
alias gitLog="git log --simplify-by-decoration --abbrev-commit --graph --decorate=short --oneline --pretty=format:\"%C(red) %D %C(reset) - %C(yellow) %an %C(reset) %b\""
alias trello=bin/trello

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#Plugin manager
#source "~/.antigen/antigen.zsh"


export NVM_DIR="/Users/Roland/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Java
export JAVA_HOME="/Library/Java/Home"
export PATH=$JAVA_HOME/bin:$PATH

export TRELLO_USER=rolandpeelen1
export TRELLO_KEY=7dd1dba6904d0e4aa9f33f1c712abe6f
export TRELLO_TOKEN=d36518a3aa935909784eb8f0feb28349f3e7fc0af0e0cbd77324578d1554b2d1
