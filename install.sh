#!/usr/bin/env bash

echo "Start Installing..."
echo "====================="

echo "Installing oh-my-zsh"
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

echo "Initializing submodule(s)"
git submodule update --init --recursive

source install/link.sh

if [ "$(uname)" == "Darwin" ]; then
    echo -e "\n\nRunning on OSX"

    source install/brew.sh
    source install/iterm.sh
    source install/nvm.sh
    source install/nvim.sh
fi

echo "Configuring zsh as default shell"
chsh -s "$(which zsh)"

echo "installing zsh plugins..."
zplug install && zplug load

# prevent zsh compinit: insecure directories
sudo chmod -R 755 /usr/local/share

echo "Done."
