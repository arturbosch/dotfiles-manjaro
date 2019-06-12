#!/bin/env sh
mv ~/.config/i3/config ~/.config/i3/config.bak
ln -s ~/Repos/dotfiles/i3/config ~/.config/i3/config
ln -s ~/Repos/dotfiles/i3/status.toml ~/.config/i3/status.toml
ln -s ~/Repos/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -s ~/Repos/dotfiles/fish/abosch.fish ~/.config/fish/conf.d/conf.fish
ln -s ~/Repos/dotfiles/ranger/rc.conf ~/.config/ranger/rc.conf
ln -s ~/Repos/dotfiles/ranger/commands.py ~/.config/ranger/commands.py
ln -s ~/Repos/dotfiles/rofi/config ~/.config/rofi/config
