#lis Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="agnoster2"

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd/mm/yyyy"

# ----------------------
# Aliases
# ----------------------
alias sshPihole='ssh roland@192.168.2.100'
alias genPass='pwgen -s 25 | head | pbcopy'
alias gitFolder="cd ~/Git"
alias cl="clear"
alias ll="ls -lsa"
alias vim="nvim"
alias vi="nvim"
alias vastEndpointDocker="docker run -t eu.gcr.io/crucial-kayak-261816/vast-pro:latest -e 172.17.0.1:42000" 
alias logADog="git log --all --decorate --oneline --graph"

# ----------------------
# Tmux Spaces
# ----------------------
alias tenzirSpace="~/Git/spaces/tenzir.sh"

# ----------------------
# Git Aliases
# ----------------------
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add --all'
alias gau='git add --update'
alias gb='git branch'
alias gbd='git branch --delete '
alias gc='git commit'
alias gca='git commit --amend'
alias gcm='git commit --message'
alias gcf='git commit --fixup'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout master'
alias gcos='git checkout staging'
alias gcod='git checkout develop'
alias gd='git diff'
alias gda='git diff HEAD'
alias gi='git init'
alias glg='git log --graph --oneline --decorate --all'
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias gm='git merge --no-ff'
alias gma='git merge --abort'
alias gmc='git merge --continue'
alias gp='git pull'
alias gpr='git pull --rebase'
alias gr='git rebase'
alias gs='git status'
alias gss='git status --short'
alias gst='git stash'
alias gsta='git stash apply'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash save'

# ----------------------
# Git Functions
# ----------------------
# Git log find by commit message
function glf() { git log --all --grep="$1"; }




# Plugins
plugins=(git osx yarn fzf-tab ssh-agent)
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
source $ZSH/oh-my-zsh.sh
export EDITOR="nvim"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#Plugin manager
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# opam configuration
test -r /Users/Roland/.opam/opam-init/init.zsh && . /Users/Roland/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# Created by `userpath` on 2020-07-07 09:38:19
export PATH="$PATH:/Users/Roland/.local/bin"
export PATH="$HOME/Library/Haskell/bin:$PATH"
[ -f "/Users/Roland/.ghcup/env" ] && source "/Users/Roland/.ghcup/env" # ghcup-env

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi 

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source "$HOME/.cargo/env"

# For CMAKE parallelization
export CMAKE_BUILD_PARALLEL_LEVEL="$(sysctl -n hw.activecpu)"
