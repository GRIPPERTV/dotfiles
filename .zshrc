###############
### Exports ###
###############

# Zsh
export ZSH="$HOME/.oh-my-zsh"

# Apps
export EDITOR="micro"
export BROWSER="chromium"

# Paths
export FONTCONFIG_PATH="/etc/fonts"
export XDG_CONFIG_HOME="$HOME/.config"

# Locale
export LC_ALL="en_US.UTF-8"

###############
### Aliases ###
###############
alias rmstuff="cd $HOME && sudo rm -r .zsh_history .lesshst .cargo go .cache"

###############
### Settings ##
###############
ZSH_THEME="robbyrussell"
#COMPLETION_WAITING_DOTS="true"
#DISABLE_UNTRACKED_FILES_DIRTY="true"

###############
### Plugins ###
###############
plugins=()

source $ZSH/oh-my-zsh.sh
