PROMPT='$SHELL_CHAR%f '

if [[ $SERVER = true ]] then
  PROMPT='%F{green}$(hostname)%f'$PROMPT
fi

RPROMPT='$(git_prompt_info) %F{green}%2c%F{blue}%f'

ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{red}$GIT_CHAR%f"
ZSH_THEME_GIT_PROMPT_CLEAN=" %F{green}$GIT_CHAR%f"
