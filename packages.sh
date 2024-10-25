#!/bin/bash

## ----------------------------------------------------------------------------
## Zsh
## ----------------------------------------------------------------------------
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## ----------------------------------------------------------------------------
## HomeBrew
## ----------------------------------------------------------------------------
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
brew update
brew upgrade

## ----------------------------------------------------------------------------
## Taps
## ---------------------------------------------------------------------------- 
taps="homebrew/cask-fonts koekeishiya/formulae"
for t in $taps ; do
        echo "Adding Tap: ${t}"
        brew tap ${t}
done

## ----------------------------------------------------------------------------
## Utils
## ---------------------------------------------------------------------------- 
brews="asdf curl git neovim llvm openssl ripgrep sourcetree tmux tmuxinator
yabai zsh difftastic mkcert pwgen gpg keychain"
for b in $brews ; do
        echo "Installing: ${b}"
        brew install ${b}
done

## ----------------------------------------------------------------------------
## Casks
## ----------------------------------------------------------------------------
casks="dropbox google-chrome iterm2 karabiner-elements linear loom numi
postgres-unofficial raycast sizeup signal slack spotify postgres brave-browser
discord docker postico"

for c in $casks ; do
        echo "Installing Cask: ${c}"
        brew install --cask ${c}
done

## ----------------------------------------------------------------------------
## Asdf
## ----------------------------------------------------------------------------
. /opt/homebrew/bin/asdf.sh
asdfs="nodejs"

for asdf in $asdfs ; do
        asdf plugin add ${asdf}
        asdf install ${asdf} latest
        asdf global ${asdf} latest
done

## ----------------------------------------------------------------------------
## XCode Installer
## ----------------------------------------------------------------------------
curl -s https://raw.githubusercontent.com/vineetchoudhary/Downloader-for-Apple-Developers/master/install.sh | bash

## ----------------------------------------------------------------------------
## OCaml
## ----------------------------------------------------------------------------
bash -c "sh <(curl -fsSL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh)"
opam init
opam switch create 5.11.1 # Pinned because no 'latest'

## ----------------------------------------------------------------------------
## Rust
## ----------------------------------------------------------------------------
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup install nightly 

## ----------------------------------------------------------------------------
## Haskell
## ----------------------------------------------------------------------------
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
ghcup install stack

## Remove outdated versions
brew cleanup
