PROMPT=' %F{yellow}%5c%F{blue}%f ';
PROMPT+='$(git_prompt_info)'$'\n'
PROMPT+="$SHELL_CHAR%f "

if [[ $SERVER = true ]] then
  PROMPT='%F{green}$(hostname)%f'$PROMPT
fi

ZSH_THEME_GIT_PROMPT_PREFIX="%F{green}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{red}$GIT_CHAR%f"
ZSH_THEME_GIT_PROMPT_CLEAN=" %F{green}$GIT_CHAR%f"
