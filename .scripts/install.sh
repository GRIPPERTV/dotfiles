# Configure and update pacman
mv pacman.conf /etc/
pacman -Syu

# Install libs/drivers/compilers and steam
pacman -S base-devel elogind mesa lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader rust go python paru xorg xorg-init gamemode lib32-gamemode fontconfig steam

# Install theme/fonts and cache fonts
paru yaru
paru helvetica
paru nerd-font
paru jetbrains
fc-cache -fv

# Download st, dwm and dwmblocks
# Don't install yet or it will use default config.def.h
mkdir $HOME/.pkg
cd $HOME/.pkg
git clone https://git.suckless.org/st
git clone https://git.suckless.org/dwm
git clone https://github.com/torrinfail/dwmblocks

# Setup dotfiles
cd $HOME/dotfiles
mv *.* $HOME
rm $HOME/.scripts/install.sh $HOME/.scripts/pacman.conf

# Now we can install st, dwm and dwmblocks
cd $HOME/.pkg
cd st && make install
cd ../dwm && make install
cd ../dwmblocks && make install

# Install misc
pacman -S htop neofetch

# Done!
rm dotfiles
