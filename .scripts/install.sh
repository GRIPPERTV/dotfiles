echo "Configuring and updating pacman..."
sudo mv pacman.conf /etc/
sudo pacman -Syu

echo "Installing base, compilers, drivers and ibs"
sudo pacman -S --needed base-devel go rust python mesa lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader gamemode lib32-gamemode lib32-fontconfig fontconfig pulseaudio xorg xorg-xinit

echo "Installing and updating paru..."
cd $HOME && mkdir .pkg && git clone https://aur.archlinux.org/paru.git
cd paru && makepkg -si
cd .. && sudo rm paru -r
paru -Syu

echo "Installing theme and fonts..."
paru yaru-gtk-theme
paru ttf-jetbrains-mono
paru ttf-twemoji

echo "Caching all fonts"
fc-cache -fv

echo "Downloading st, dwm and dwmblocks..."
cd $HOME/.pkg
git clone https://git.suckless.org/st
git clone https://git.suckless.org/dwm
git clone https://github.com/torrinfail/dwmblocks

echo "Installing st patches..."
cd st
curl 'https://st.suckless.org/patches/scrollback/st-scrollback-0.8.5.diff' --output 3.diff
curl 'https://st.suckless.org/patches/clipboard/st-clipboard-20180309-c5ba9c0.diff' --output 1.diff
curl 'https://st.suckless.org/patches/scrollback/st-scrollback-mouse-20220127-2c5edf2.diff' --output 4.diff
curl 'https://st.suckless.org/patches/dynamic-cursor-color/st-dynamic-cursor-color-0.8.4.diff' --output 2.diff
patch --merge -i 1.diff && patch --merge -i 2.diff && patch --merge -i 3.diff && patch --merge -i 4.diff

echo "Installing dwm patches..."
cd ../dwm && curl 'https://dwm.suckless.org/patches/notitle/dwm-notitle-20210715-138b405.diff' --output 1.diff && patch --merge -i 1.diff

echo "Creating dotfiles..."
cd $HOME/dotfiles
sudo mv .* $HOME
sudo cp .pkg .scripts $HOME

echo "Installing st, dwm and dwmblocks..."
cd $HOME/.pkg
cd st && sudo make clean install
cd ../dwm && sudo make clean install
cd ../dwmblocks && sudo make clean install

echo "Installing needed dotfiles packages..."
sudo pacman -S --needed zsh scrot xclip && paru rlaunch

echo "Installing Oh My Zsh (default theme)..."
cd $HOME && sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing steam, ungoogled-chromium, htop and neofetch..."
sudo pacman -S --needed steam htop neofetch && paru ungoogled

# Done!
echo "Done!"
