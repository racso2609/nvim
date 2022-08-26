#!/usr/bin/env bash

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

# Install latest nodejs
if [ ! -x "$(command -v node)" ]; then
    curl --fail -LSs https://install-node.now.sh/latest | sh
    export PATH="/usr/local/bin/:$PATH"
    # Or use package manager, e.g.
    # sudo apt-get install nodejs
    npm i -g neovim 
fi

#install paq
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# -- install efm languagge server
sudo pacman -S go
go install github.com/mattn/efm-langserver@latest


pyenv install 2.7.11
pyenv install 3.10.0

pyenv virtualenv 2.7.11 neovim2
pyenv virtualenv 3.10.0 neovim3

pyenv activate neovim2
pip install neovim
# pyenv which python  # Note the path

pyenv activate neovim3
pip install neovim
  # pyenv which python  # Note the path
