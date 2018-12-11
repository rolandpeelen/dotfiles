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
#brew cask install appcleaner
brew cask install google-chrome

## Chat
brew cask install skype

## Entertainment
brew cask install spotify
brew cask install vlc

## Virtualization
#brew cask install vmware-fusion
#brew cask install virtualbox
#brew cask install vagrant

## Other
#brew cask install anki
brew cask install sizeup
brew cask install transmission

## If it exists as an .app, link it to /Users/<you>/Applications
brew linkapps --local

## Remove outdated versions
brew cleanup
brew cask cleanup
