echo "Installing software"
sudo pacman -S lsof git youtube-dl htop udisksctl udisks2 wget fuse2 gksu kitty exa ripgrep fd neofetch tokei nnn fzf zjump pywal udiskie ntfs-3g lxappearance lxrandr tig
echo "Installing archive extract tools"
sudo pacman -S xarchiver p7zip zip unzip unrar

echo "Installing sdkman"
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk i java
sdk i gradle
sdk i maven
sdk i groovy

echo "From Yaourt"
yaourt light-git
yaourt gnome-breeze-git
yaourt arc-icon-theme-git