# Configure and update pacman
mv pacman.conf /etc/
pacman -Syu

# Install drivers, compilers, libs and steam
pacman -S elogind base-devel mesa lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader rust go python paru xorg xorg-init gamemode lib32-gamemode steam

# Theme and fonts
paru yaru
paru helvetica
paru nerd-font
paru jetbrains

# Setup settings
mv ../*.* $HOME
rm $HOME/.scripts/install.sh $HOME/.scripts/pacman.conf

# dwm


# Misc
pacman -S htop neofetch
