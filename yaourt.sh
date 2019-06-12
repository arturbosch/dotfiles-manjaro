#!/bin/env sh
echo "Installing yaourt"
cd /tmp
git clone https://aur.archlinux.org/package-query.git
cd package-query
makepkg -s
sudo pacman -U package-query-*.pkg.tar.xz
cd ..
git clone https://aur.archlinux.org/yaourt.git
cd yaourt/
makepkg -s
sudo pacman -U yaourt-*.pkg.tar.xz

