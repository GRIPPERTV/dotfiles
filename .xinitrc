#################
##  Configure  ##
#################

# Keyboard layout
setxkbmap -model abnt2 -layout br -variant abnt2

# Monitor resolution
xrandr --output VGA-1 --mode 1280x800

################
##  Programs  ##
################

# Background
feh --bg-fill .background.jpg

# Dwm Status Bar
dwmblocks &

# Window Manager
exec dwm
