echo "Installing xorg"
sudo pacman -S xorg-server xorg-init

echo "Installing i3"
sudo pacman -S i3-gaps i3status dmenu
echo "exec i3" > ~/.xinitrc

echo "Installing lightdm"
sudo pacman -S lightdm lightdm-gtk-greeter
sudo systemctl enable lightdm.service

echo "Installing archive extract tools"
sudo pacman -S xarchiver p7zip zip unzip unrar

echo "Installing software"
sudo pacman -S lsof git youtube-dl htop udisks2 wget fuse2 alacritty exa ripgrep fd neofetch tokei nnn fzf udiskie ntfs-3g lxappearance lxrandr tig xdg-utils alsa-utils moc findutils rofi feh redshift powertop tlp

# zjump pywal udisksctl gksu

echo "Installing fish"
sudo pacman -S fish
sudo chsh $(users | head)
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
fisher add jethrokuan/fzf jethrokuan/z matchai/spacefish reitzig/sdkman-for-fish

echo "Installing browsers"
sudo pacman -S firefox surf

echo "Installing additional dev tools"
sudo pacman -S neovim nodejs yarn
sudo pacman -S rustup
rustup default stable

echo "Installing i3status-rs"
cd ~/Repos
git clone https://github.com/greshake/i3status-rust
cd i3status-rs
cargo build --release
cp target/release/i3status-rs ~/.local/bin/i3status-rs

echo "Installing sdkman"
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk i java
sdk i gradle
sdk i maven
sdk i groovy

echo "From Yaourt"
yaourt betterlockscreen
yaourt redshift-qt
yaourt light-git # number 9
yaourt gnome-breeze-git
yaourt arc-icon-theme-git
