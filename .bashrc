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
	rm $HOME/.cache/chromium $HOME/.cache/mesa_shader_cache -r > /dev/null
}
