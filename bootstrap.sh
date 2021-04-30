#!/bin/bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished

# Link the JavaScript Console to PATH
ln /System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc /usr/local/bin


dotfiles=".bashrc .config .bash_profile .zshrc .gitconfig .gitignore .screenrc .oh-my-zsh"

## Replace homedir $dotfiles with the ones from repo
for file in $dotfiles ; do
    echo "Removing old ~/${file}"
    rm -f ~/${file}
    echo "Symlinking ${file} from ~/dotfiles directory"
    ln -s ${dotfilesDir}/${file} ~/${file}
done

