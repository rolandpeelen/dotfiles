#!/bin/bash

to_symlink=".config .fzf.tab .gitconfig .gitignore .screenrc .stdCommitMessage .tmux.conf .zshrc"

## Replace homedir $dotfiles with the ones from repo
for symlink in $to_symlink ; do
    echo "Removing old ~/${symlink}"
    rm -rf ~/${symlink}
    echo "Symlinking ${symlink} from ~/dotfiles directory"
    ln -s ./Git/dotfiles/${symlink} ~/${symlink}
done

