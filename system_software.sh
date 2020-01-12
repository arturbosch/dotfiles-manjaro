#!/bin/env sh
mkdir ~/.system
cd ~/.system

echo "Installing i3status-rs"
git clone https://github.com/greshake/i3status-rust
cd i3status-rs
cargo build --release
cp target/release/i3status-rs ~/.local/bin/i3status-rs

echo "Installing st"
git clone https://github.com/arturbosch/st
cd st && sudo make install

echo "Installing snapd"
git clone https://aur.archlinux.org/snapd.git
cd snapd
makepkg -si
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap

echo "Installing micro"
git clone https://github.com/zyedidia/micro
cd micro
make build
sudo mv micro /usr/local/bin

echo "Installing betterlockscreen"
git clone https://github.com/pavanjadhaw/betterlockscreen.git
cd betterlockscreen
cp betterlockscreen ~/.local/bin/
sudo cp system/betterlockscreen@.service /etc/systemd/system/
sudo systemctl enable betterlockscreen@artur
cd ~/.dotfiles
betterlockscreen -u ./desktop.jpg
