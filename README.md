# dotfiles.local
> My development environment settings.

# Install
- `chsh -s $(which zsh)`
- `git clone https://github.com/thoughtbot/dotfiles.git ~/dotfiles`
- `brew tap thoughtbot/formulae`
- `brew install rcm`
- `env RCRC=$HOME/dotfiles/rcrc rcup`
- `rcup`
- `git clone --recursive https://github.com/zack9433/dotfiles.local.git ~/dotfiles.local`
- `cd ~/dotfiles.local`
- `./install.sh`

# Terminal Setting
Use iTerm3

## Italic Font
[https://alexpearce.me/2014/05/italics-in-iterm2-vim-tmux/](https://alexpearce.me/2014/05/italics-in-iterm2-vim-tmux/)

## Base16 Theme
Import iterm3 color presets, default theme is [oceanic-next](https://github.com/mhartington/oceanic-next-iterm).

## Font
Set iterm3 font size to 15pt and font to `Office Code Pro Light` which is download form this [repo](https://github.com/nathco/Office-Code-Pro).

## ASCII Font
Set iterm3 font size to 13pt and font to `Sauce Code Pro Light Nerd Font Complete` which is download form this [repo](https://github.com/ryanoasis/nerd-fonts).
