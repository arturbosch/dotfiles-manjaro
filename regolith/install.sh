#!/usr/bin/env sh
# Regolith Linux after install script

# system
sudo apt install htop powertop tlp curl fish git fzf ripgrep tig meld tk tcl tldr tldr-py autojump fd-find suckless-tools asciinema scrot thunar geary neovim neovim-qt

curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

# dev

## js
sudo apt install nodejs yarn

## jdk
# curl -s "https://get.sdkman.io" | bash
# source "$HOME/.sdkman/bin/sdkman-init.sh"
# sdk i gradle
# sdk i groovy
# sdk i maven
# sdk i groovyserv
# sdk i java
