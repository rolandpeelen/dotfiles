#lis Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="agnoster"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd/mm/yyyy"

# ----------------------
# Aliases
# ----------------------
alias genPass='pwgen -s 25 | head | pbcopy'
alias gitFolder="cd ~/Git"
alias cl="clear"
alias ll="ls -lsa"
alias vim="nvim"
alias vi="nvim"
killAll () {
  ps aux | grep $1 | awk '{print $2}' | xargs kill -9
}

# Ghostty
alias ghostty="/Applications/Ghostty.app/Contents/MacOS/ghostty"
alias copy-terminal-info='function _copy_terminfo() { infocmp -x | ssh $1 -- tic -x -; }; _copy_terminfo'

# ----------------------
# Git Aliases
# ----------------------
alias tma='tmux attach -t'
alias tmf='tmux new-session -t'
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
plugins=(git fzf-tab ssh-agent web-search)
eval `keychain --eval --agents ssh --inherit any id_rsa &> /dev/null`

# Enable Tmux  Popup for fzf-tab
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export EDITOR="nvim"

# Language Support
## Haskell
export HASKELL_BIN=/Users/rwjpeelen/.local/bin
export PATH=$PATH:$HASKELL_BIN
[ -f "/Users/rwjpeelen/.ghcup/env" ] && source "/Users/rwjpeelen/.ghcup/env" # ghcup-env

## rust
source $HOME/.cargo/env # Rust env
export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/lib"

## Brew
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
. /opt/homebrew/share/zsh/site-functions



# For normal llvm
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

# For llvm 13
export PATH="/opt/homebrew/opt/llvm@13/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm@13/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm@13/include"

# For compilers to find libffi you may need to set:
export LDFLAGS="-L/opt/homebrew/opt/libffi/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libffi/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libffi/lib/pkgconfig"


# Homebrew stuff
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PKG_CONFIG_PATH="/opt/homebrew/lib/pkgconfig:/opt/homebrew/share/pkgconfig:$PKG_CONFIG_PATH"
export DYLD_LIBRARY_PATH="/opt/homebrew/Cellar/libsoup/3.6.0/lib:$DYLD_LIBRARY_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/icu4c/lib/pkgconfig:/opt/homebrew/lib/pkgconfig:/opt/homebrew/share/pkgconfig:$PKG_CONFIG_PATH"


# Make libsoup available on path 3.6.0
export DYLD_LIBRARY_PATH=/opt/homebrew/Cellar/libsoup/3.6.0/lib:DYLD_LIBRARY_PATH

# Add postgresql from gui 
export PATH="/Applications/Postgres.app/Contents/Versions/16/bin:$PATH"

# Re-export tty so gpg works
export GPG_TTY=$(tty)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/rwjpeelen/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/rwjpeelen/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/rwjpeelen/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/rwjpeelen/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# if [[ "$TERM_PROGRAM" == "ghostty" ]]; then
#     export TERM=xterm-256color
# fi
#
source $ZSH/oh-my-zsh.sh
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# dune
source $HOME/.local/share/dune/env/env.zsh

# Just
# # Needed for just autocomplete, but will pull in all of brew
# https://github.com/casey/just#shell-completion-scripts
# Init Homebrew, which adds environment variables
eval "$(brew shellenv)"
# Add Homebrew's site-functions to fpath
fpath=($HOMEBREW_PREFIX/share/zsh/site-functions $fpath)

# Needed for autosuggestions (does compinit)
source $ZSH/oh-my-zsh.sh


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/Users/rwjpeelen/.opam/opam-init/init.zsh' ]] || source '/Users/rwjpeelen/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration
