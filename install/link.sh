# Path to local dotfiles
DOTFILES_LOCAL=$HOME/dotfiles.local

# prompt pure theme -> https://github.com/sindresorhus/pure
mkdir -p $HOME/.zfunctions
fpath=("$HOME/.zfunctions" $fpath)
[ ! -f "$HOME/.zfunctions/prompt_pure_setup" ] && ln -s "$DOTFILES_LOCAL/prompt/pure.zsh" "$HOME/.zfunctions/prompt_pure_setup"
[ ! -f "$HOME/.zfunctions/async" ] && ln -s "$DOTFILES_LOCAL/prompt/async.zsh" "$HOME/.zfunctions/async"

# create local config link
[ ! -f "$HOME/.zshrc.local" ] && ln -s "$DOTFILES_LOCAL/.zshrc.local"
[ ! -f "$HOME/.gitconfig.local" ] && ln -s "$DOTFILES_LOCAL/.gitconfig.local"
[ ! -f "$HOME/.aliases.local" ] && ln -s "$DOTFILES_LOCAL/.aliases.local"
