#!/usr/bin/env bash

if test ! "$(which brew)"; then
  echo "Installing homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  gem install coderay
fi

echo -e "\n\nInstalling homebrew packages..."
echo "=============================="

# cli tools
brew install tree

# development tools
brew install git
brew install python3
brew install hub
brew install reattach-to-user-namespace
brew install tmux
brew install zsh
brew install highlight
brew install nvm
brew install markdown
brew install pt
brew install fzf
# Install shell extensions
/usr/local/opt/fzf/install

# install neovim
brew install neovim/neovim/neovim

export PATH=/usr/local/share/python3:$PATH

exit 0
