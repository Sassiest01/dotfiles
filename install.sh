#!/bin/bash

# Install Oh My Bash
if [[ ! -d $OSH ]]; then
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
fi

# Clone dotfiles
if [[ ! -d ~/dotfiles ]]; then
    git clone https://github.com/Sassiest01/dotfiles.git ~/dotfiles
fi

ln --force --no-dereference --symbolic ~/dotfiles/bashrc ~/.bashrc
ln --force --no-dereference --symbolic ~/dotfiles/bash_aliases ~/.bash_aliases
ln --force --no-dereference --symbolic ~/dotfiles/bash_profile ~/.bash_profile
ln --force --no-dereference --symbolic ~/dotfiles/omb-rc ~/.omb-rc

