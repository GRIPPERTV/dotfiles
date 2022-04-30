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
#alias X=Y

###############
## Functions ##
###############
rmstuff() {
	cd $HOME

	# Remove unneeded files
	sudo rm -r .cache .cargo go .mono .pki .Xauthority .zcompdump-Artix-5.8.1 .zsh_history .lesshst .pulse-cookie .fehbg

	# Clear packages
	echo y | sudo pacman -R $(pacman -Qtdq)
}

search() {
	grep -iIHrn --color=always "$1" . | less -r
}

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
