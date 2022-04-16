#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export LC_ALL="en_US.UTF-8"
export EDITOR="micro"
export BROWSER="chromium"
export FONTCONFIG_PATH="/etc/fonts"

clear-cache() {
	sudo rm $HOME/.cache -r > /dev/null
}
