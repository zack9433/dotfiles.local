#!/usr/bin/env bash

# Load RVM, if you are using it
[[ -s $HOME/.rvm/scripts/rvm ]] && source "$HOME/.rvm/scripts/rvm"

# Add rvm gems and nginx to the path
export PATH=$PATH:~/.gem/ruby/1.8/bin:/opt/nginx/sbin

# Path to the bash it configuration
export BASH_IT=$HOME/.bash_it

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='slick'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Set my editor and git editor
export EDITOR="nvim"
export GIT_EDITOR='nvim'

# Set the path nginx
export NGINX_PATH='/opt/nginx'

# Don't check mail when opening terminal.
unset MAILCHECK


# Change this to your console based IRC client of choice.

export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli

export TODO="t"

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/xvzf/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# Update PATH
export PATH=/usr/local/bin:$PATH

# Load Bash It
source "$BASH_IT/bash_it.sh"

# ngrok alias
alias ngrok="~/./ngrok"

# Set terminal to use 256 color
export TERM=xterm-256color

export PATH="/usr/local/mysql/bin:$PATH"

# git flow alias
alias gfi="git flow init"
alias gffl="git flow feature list"
alias gffp="git flow feature publish"
alias gffs="git flow feature start"
alias gfff="git flow feature finish"
alias gffc="git flow feature checkout"

# alias for nvim
alias nv="nvim"

eval "$(hub alias -s)"
# complete -W "$(teamocil --list)" teamocil
source ~/.nvm/nvm.sh
source ~/.bin/tmuxinator.bash

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-material.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

export PATH="/usr/local/sbin:$PATH"

# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
