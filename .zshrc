#lis Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="agnoster"

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd/mm/yyyy"

# Plugins
plugins=(git osx yarn)
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
source $ZSH/oh-my-zsh.sh
export EDITOR="nvim"

# Aliasses
alias gitFolder="cd ~/Git"
alias cl="clear"
alias ll="ls -lsa"
alias vim="nvim"
alias vi="nvim"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#Plugin manager
export NVM_DIR="~/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
