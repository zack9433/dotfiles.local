#!/usr/bin/env bash

"Installing dotfiles.local"

echo "Initializing submodule(s)"
git submodule update --init --recursive

source install/link.sh

if [ "$(uname)" == "Darwin" ]; then
    echo -e "\n\nRunning on OSX"

    source install/brew.sh
    source install/iterm.sh
    source install/nvm.sh
fi

echo "Configuring zsh as default shell"
chsh -s $(which zsh)

echo "Done."
