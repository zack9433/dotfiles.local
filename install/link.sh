#!/usr/bin/env bash

# Path to local dotfiles
DOTFILES_LOCAL=$HOME/dotfiles.local

# set base16-shell link
[ ! -d "$HOME/.config" ] && mkdir -p "$HOME/.config"
ln -sf "$DOTFILES_LOCAL/base16/shell" "$HOME/.config/base16-shell"

# create local config link
[ ! -f "$HOME/.zshrc.local" ] && ln -sf "$DOTFILES_LOCAL/.zshrc.local" "$HOME/.zshrc.local"
[ ! -f "$HOME/.gitconfig.local" ] && ln -sf "$DOTFILES_LOCAL/.gitconfig.local" "$HOME/.gitconfig.local"
[ ! -f "$HOME/.aliases.local" ] && ln -sf "$DOTFILES_LOCAL/.aliases.local" "$HOME/.aliases.local"
[ ! -f "$HOME/.tmux.conf.local" ] && ln -sf "$DOTFILES_LOCAL/.tmux.conf.local" "$HOME/.tmux.conf.local"

# set zplug link
ln -sf "$DOTFILES_LOCAL/zplug" "$HOME/.zplug"

# set neovim link
ln -sf "$DOTFILES_LOCAL/.nvimrc" "$HOME/.config/nvim/init.vim"