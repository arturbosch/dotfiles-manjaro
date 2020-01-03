echo "Installing xorg"
sudo pacman -S xorg-server xorg-init

echo "Installing i3"
sudo pacman -S i3-gaps i3status scrot dmenu
echo "exec i3" > ~/.xinitrc

echo "Installing lightdm"
sudo pacman -S lightdm lightdm-gtk-greeter
sudo systemctl enable lightdm.service

echo "Installing archive extract tools"
sudo pacman -S xarchiver p7zip zip unzip unrar

echo "Installing browser and mail"
sudo pacman -S firefox evolution gnome-keyring

echo "Installing software"
sudo pacman -S lsof git youtube-dl htop udisks2 wget fuse2 alacritty exa ripgrep fd neofetch tokei nnn fzf udiskie ntfs-3g lxappearance lxrandr tig xdg-utils alsa-utils moc findutils rofi feh redshift powertop tlp pcmanfm iw compton dunst evince viewnior openssh openvpn perf meld tk tcl gdb awesome-terminal-fonts ttf-font-awesome blueman bluez-utils celluloid time xclip

echo "Installing sound"
sudo pacman -S pulseaudio pavucontrol pamixer alsa-plugins pulseaudio-alsa

echo "Installing printers"
sudo pacman -S cups gutenprint simple-scan

echo "Installing vim plugin manager"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing fish"
sudo pacman -S fish
sudo chsh $(users | head)

echo "Installing additional dev tools"
sudo pacman -S python python-pip
pip install --user pytest
sudo pacman -S neovim nodejs yarn code
sudo pacman -S rustup
rustup default stable

