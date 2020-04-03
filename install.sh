#!/bin/bash 

set -ex

# download theme into customs theme folder
curl https://raw.githubusercontent.com/ozkar99/ozkar-omz/master/ozkar.zsh-theme -o ~/.oh-my-zsh/custom/themes/ozkar.zsh-theme

# change theme to ozkar
sed -i 's/ZSH_THEME=.*/ZSH_THEME="ozkar"/' ~/.zshrc
