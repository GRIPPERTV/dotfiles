# Install paru, configure pacman and update mirrors
cd $HOME && mkdir .pkg && git clone https://aur.archlinux.org/paru.git
cd paru && makepkg -si && cd .. && sudo rm paru -r
sudo mv pacman.conf /etc/ && paru -Syu

# Install base, compilers, drivers and libs
sudo pacman -S --needed base-devel go rust python mesa lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader gamemode lib32-gamemode lib32-fontconfig fontconfig pulseaudio xorg xorg-xinit

# Install theme, fonts and cache all fonts
paru yaru-gtk-theme
paru ttf-jetbrains-mono
paru ttf-twemoji
fc-cache -fv

# Download st, dwm, dwmblocks and dwl
cd $HOME/.pkg
git clone https://git.suckless.org/st
git clone https://git.suckless.org/dwm
git clone https://github.com/torrinfail/dwmblocks

# Install st patches (scrollback-mouse, clipboard and dynamic cursor color)
cd st
curl 'https://st.suckless.org/patches/scrollback/st-scrollback-0.8.5.diff' --output 3.diff
curl 'https://st.suckless.org/patches/clipboard/st-clipboard-20180309-c5ba9c0.diff' --output 1.diff
curl 'https://st.suckless.org/patches/scrollback/st-scrollback-mouse-20220127-2c5edf2.diff' --output 4.diff
curl 'https://st.suckless.org/patches/dynamic-cursor-color/st-dynamic-cursor-color-0.8.4.diff' --output 2.diff
patch --merge -i 1.diff && patch --merge -i 2.diff && patch --merge -i 3.diff && patch --merge -i 4.diff

# Install dwm patch (no title)
cd ../dwm && curl 'https://dwm.suckless.org/patches/notitle/dwm-notitle-20210715-138b405.diff' --output 1.diff && patch --merge -i 1.diff

# Install dwl patch (monitor-config)
cd ../dwl && curl 'https://github.com/djpohly/dwl/compare/main...PalanixYT:monfig.patch' --output 1.diff && patch --merge -i 1.diff

# Create dotfiles
cd $HOME/dotfiles
sudo mv .* $HOME
sudo cp .pkg .scripts $HOME

# Install st, dwm, dwmblocks and dwl
cd $HOME/.pkg
cd st && sudo make install
cd ../dwm && sudo make install
cd ../dwmblocks && sudo make install
cd ../dwl && sudo make install

# Install needed dotfiles packages
sudo pacman -S --needed feh zsh scrot xclip && paru rlaunch

# Install Oh My Zsh (default theme)
cd $HOME && sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install steam, htop, neofetch and ungoogled
sudo pacman -S --needed steam htop neofetch && paru ungoogled

# Clear pacman/paru
sudo pacman -R $(pacman -Qtdq) && paru -Scc

# Done!
echo "Done!"
