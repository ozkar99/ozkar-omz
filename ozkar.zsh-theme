# ozkar.zsh-theme

# root check, commented because we should only use sudo
# if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi

unsetopt AUTO_CD # disable auto-cd
export EDITOR=vim

# color vars
eval my_blue='$FG[032]'
eval my_gray='$FG[237]'
eval my_orange='$FG[214]'
eval my_lightblue='$FG[075]'
eval my_green='$FG[078]'

# primary prompt: ~ $
PROMPT='%{$my_blue%}%~%{$reset_color%} %(!.#.$) '

# right prompt
RPROMPT='$(virtualenv_prompt_info) $(git_prompt_info)%{$reset_color%}%'

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="%{$my_lightblue%}(%{$my_green%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$my_lightblue%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$my_orange*%{$reset_color%}"

# virtualenv settings
ZSH_THEME_VIRTUALENV_PREFIX="%{$my_lightblue%}[%{$my_green%}"
ZSH_THEME_VIRTUALENV_SUFFIX="%{$my_lightblue%}]%{$reset_color%}"

# alias and what not, basically this should be on plugins but life is too short.

PATH=$PATH:~/.bin # i like to keep scripts here

ulimit -n 4096

# run tcp-dump on a remote host and forward to local wireshark
wireshark-ssh() {
  if [[ -z "$1" ]]; then
    echo "hostname missing"
    return -1
  fi

  ssh $1 "sudo tcpdump -U -i any -s0 -w -" | wireshark -k -i -
}

