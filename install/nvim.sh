#!/usr/bin/env bash

pip3 install neovim

echo "Installing VIM plugin manager..."
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install font
if [ "$(uname)" == "Darwin" ]; then
    echo -e "\n\nInstalling Droid Sans Mono for Powerline Nerd Font"
    ( cd ~/Library/Fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20for%20Powerline%20Nerd%20Font%20Complete.otf )
fi
