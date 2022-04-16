#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR="micro"
export BROWSER="chromium"
export LC_ALL="en_US.UTF-8"
export FONTCONFIG_PATH="/etc/fonts"

rcache() {
	sudo rm $HOME/.cache -r > /dev/null
}
