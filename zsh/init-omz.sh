# oh-my-zsh and oh-my-zsh custom pathes
# oh-my-zsh custom overrides oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$RC/zsh

# theme config
# SHELL_CHAR='%F{green}❱%F{red}❱%F{yellow}❱%f'
SHELL_CHAR='%F{green}❱%f'
GIT_CHAR=""
ZSH_THEME="jani"

# oh my zsh config
CASE_SENSITIVE="false"
DISABLE_AUTO_UPDATE="false"
DISABLE_LS_COLORS="false"
DISABLE_AUTO_TITLE="false"
DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd/mm/yyyy"
UPDATE_ZSH_DAYS=7

# oh my zsh plugins
plugins=( git autojump )

source $ZSH/oh-my-zsh.sh
