#################
##  Configure  ##
#################

# Keyboard layout
setxkbmap -model abnt2 -layout br -variant abnt2

# Monitor 1440x900
xrandr --output VGA-1 --mode 1440x900

################
##  Programs  ##
################

# Background
feh --bg-fill .background.jpg

# Dwm Status Bar
dwmblocks &

# Window Manager
exec dwm
