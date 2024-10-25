#lis Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="agnoster"

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd/mm/yyyy"

# ----------------------
# Aliases
# ----------------------
notify_cmd() { "$@"; afplay /System/Library/Sounds/Funk.aiff; }
alias n=notify_cmd
alias genPass='pwgen -s 25 | head | pbcopy'
alias gitFolder="cd ~/Git"
alias cl="clear"
alias ll="ls -la"
alias vim="nvim"
alias evim="esy nvim"
alias vi="nvim"
alias gt="nocorrect gt"
killAll () {
  ps aux | grep $1 | awk '{print $2}' | xargs kill -9
}

alias ghostty="/Applications/Ghostty.app/Contents/MacOS/ghostty"

# ----------------------
# Git Aliases
# ----------------------
alias tma='tmux attach -t'
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

# Plugins
plugins=(git fzf fzf-tab ssh-agent)
eval `keychain --eval --agents ssh --inherit any id_rsa &> /dev/null`
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
source $ZSH/oh-my-zsh.sh
export EDITOR="nvim"

source $HOME/.cargo/env # Rust env
export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/lib"

export HASKELL_BIN=/Users/rwjpeelen/.local/bin
export PATH=$PATH:$HASKELL_BIN

eval "$(/opt/homebrew/bin/brew shellenv)"
. /opt/homebrew/opt/asdf/etc/bash_completion.d/asdf.bash
. /opt/homebrew/opt/asdf/libexec/asdf.sh


export PATH=$PATH:/opt/homebrew/opt/postgresql@15/bin

export GPG_TTY=$(tty)

export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

export PATH="/opt/homebrew/opt/llvm@13/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm@13/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm@13/include"


# For compilers to find libffi you may need to set:
export LDFLAGS="-L/opt/homebrew/opt/libffi/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libffi/include"

# For pkg-config to find libffi you may need to set:
export PKG_CONFIG_PATH="/opt/homebrew/opt/libffi/lib/pkgconfig"

#compdef gt
###-begin-gt-completions-###
#
# yargs command completion script
#
# Installation: /opt/homebrew/Cellar/graphite/0.20.19/bin/gt completion >> ~/.zshrc
#    or /opt/homebrew/Cellar/graphite/0.20.19/bin/gt completion >> ~/.zprofile on OSX.
#
_gt_yargs_completions()
{
  local reply
  local si=$IFS
  IFS=$'
' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" /opt/homebrew/Cellar/graphite/0.20.19/bin/gt --get-yargs-completions "${words[@]}"))
  IFS=$si
  _describe 'values' reply
}
compdef _gt_yargs_completions gt
###-end-gt-completions-###

# opam configuration
[[ ! -r /Users/rwjpeelen/.opam/opam-init/init.zsh ]] || source /Users/rwjpeelen/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# bun completions
[ -s "/Users/rwjpeelen/.bun/_bun" ] && source "/Users/rwjpeelen/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

[ -f "/Users/rwjpeelen/.ghcup/env" ] && source "/Users/rwjpeelen/.ghcup/env" # ghcup-env

# pnpm
export PNPM_HOME="/Users/rwjpeelen/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export DENO_INSTALL="/Users/rwjpeelen/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Make libsoup available on path 3.6.0
export DYLD_LIBRARY_PATH=/opt/homebrew/Cellar/libsoup/3.6.0/lib:DYLD_LIBRARY_PATH

