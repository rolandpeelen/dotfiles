## Load bash-completion for a number of commands
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

## Setup bash environment
for f in $(ls ~/dotfiles/bash) ; do
    source ~/dotfiles/bash/${f}
done

