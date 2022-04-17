#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR="micro"
export BROWSER="chromium"
export LC_ALL="en_US.UTF-8"
export FONTCONFIG_PATH="/etc/fonts"
export XDG_CONFIG_HOME="$HOME/.config"

rstuff() {
	sudo rm $HOME/.cache $HOME/.cargo $HOME/.bash_history $HOME/.lesshst -r > /dev/null
	echo "Done"
}
