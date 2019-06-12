echo "Installing archive extract tools"
sudo pacman -S xarchiver p7zip zip unzip unrar

echo "Installing software"
sudo pacman -S lsof git youtube-dl htop udisksctl udisks2 wget fuse2 gksu alacritty exa ripgrep fd neofetch tokei nnn fzf zjump pywal udiskie ntfs-3g lxappearance lxrandr tig xdg-utils alsa-utils moc findutils rofi

echo "Installing fish"
sudo pacman -S fish fisherman
sudo chsh $(users | head)
fisher add jethrokuan/fzf jethrokuan/z matchai/spacefish reitzig/sdkman-for-fish

echo "Installing browsers"
sudo pacman -S firefox surf

echo "Installing additional dev tools"
sudo pacman -S neovim nodejs yarn
sudo pacman -S rustup
rustup default stable

echo "Installing sdkman"
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk i java
sdk i gradle
sdk i maven
sdk i groovy

echo "From Yaourt"
yaourt light-git # number 9
yaourt gnome-breeze-git
yaourt arc-icon-theme-git
