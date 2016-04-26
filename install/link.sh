#!/bin/sh

# Path to local dotfiles
DOTFILES_LOCAL=$HOME/dotfiles.local

# prompt pure theme -> https://github.com/sindresorhus/pure
ln -sf "$DOTFILES_LOCAL/prompt/pure.zsh" "$HOME/.oh-my-zsh/themes/pure.zsh-theme"

# create local config link
[ ! -f "$HOME/.zshrc.local" ] && ln -s "$DOTFILES_LOCAL/.zshrc.local"
[ ! -f "$HOME/.gitconfig.local" ] && ln -s "$DOTFILES_LOCAL/.gitconfig.local"
[ ! -f "$HOME/.aliases.local" ] && ln -s "$DOTFILES_LOCAL/.aliases.local"
