# My Arch Linux setup

## Installing Arch Linux

- https://linuxhint.com/setup-luks-encryption-on-arch-linux/
- https://www.youtube.com/watch?v=nSHOb8YU9Gw
- https://linuxhint.com/install-yaourt-arch-linux/
- https://github.com/maximbaz/dotfiles/blob/master/INSTALL_ARCH.md

## Setup

- cd ~/Repos
- git clone https://github.com/arturbosch/st
- cd st && sudo make install
- git clone https://github.com/arturbosch/dotfiles
- chmod +x -R dotfiles
- cd dotfiles
- ./software.sh
- ./yaourt.sh
- ./software_from_yaourt.sh
- ./mkdirs.sh
- ./links.sh

## nvim & coc

- https://github.com/neoclide/coc.nvim
- :PlugInstall
- :UpdateRemotePlugins
- :CoCInstall coc-python coc-emmet coc-yaml coc-json coc-tsserver coc-html coc-css coc-eslint coc-prettier coc-java
