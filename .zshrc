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
alias vastPro="~/Git/tenzir/event-horizon/vast-pro/build/bin/vast"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#Plugin manager
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# opam configuration
test -r /Users/Roland/.opam/opam-init/init.zsh && . /Users/Roland/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
