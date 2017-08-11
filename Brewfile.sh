#!/bin/bash

## Always make sure to use latest Homebrew
brew update

## Update already-installed formula
brew upgrade

## Install cask
brew install caskroom/cask/brew-cask

## Editor
brew install vim --override-system-vi --with-lua

## Git
brew install git
#brew cask install github

## Completions
brew tap homebrew/completions
brew install bash-completion
brew install bundler-completion
brew install gem-completion
brew install pip-completion
brew install rails-completion
brew install rake-completion
brew install ruby-completion

## Utils
#brew cask install appcleaner
brew install autoconf
brew install automake
brew install ctags
brew install curl
brew install dos2unix
brew cask install gpgtools
brew install libyaml
brew install openssl
brew install p7zip
brew install rmtrash
brew install tidy-html5
brew install tmux
brew install tree
brew install unrar
brew install v8
brew install watch
brew install watchman
brew install wget
brew install xz

# Security utils
brew install john

# Network utils
brew install ettercap
brew install netcat
brew install nmap
brew install reaver
brew install tcpdump
brew install wireshark

## Software development
brew install erlang
brew install npm
#brew install nvm
brew install go
brew install python3
brew install rbenv
brew install rbenv-ctags
brew install rbenv-gemset
brew install ruby-build
#brew cask install phpstorm
#brew case install pycharm
#brew cask install rubymine

## Heroku
brew install heroku-toolbelt

## Web
brew cask install firefox
brew cask install google-chrome
brew cask install opera

## Chat
brew cask install google-hangouts
brew cask install skype

## Entertainment
brew cask install spotify
brew cask install soundnode-app
brew cask install vlc

## Virtualization
#brew cask install vmware-fusion
#brew cask install virtualbox
#brew cask install vagrant

## Other
#brew cask install anki
brew cask install bankid
brew cask install evernote
brew cask install flux
brew cask install openemu
brew cask install sizeup
brew cask install utorrent

## If it exists as an .app, link it to /Users/<you>/Applications
brew linkapps --local

## Remove outdated versions
brew cleanup
brew cask cleanup
