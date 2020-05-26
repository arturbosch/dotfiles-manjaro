#!/usr/bin/env sh
# Regolith Linux after install script

# additional software
sudo apt install htop powertop tlp snapd \
    printer-driver-gutenprint \
    curl fish git fzf ripgrep tig meld tk tcl tldr tldr-py autojump \
    fd-find suckless-tools asciinema scrot \
    thunar geary \
    neovim neovim-qt \
    nodejs yarn \
    hugo jekyll

# fish shell package manager
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

# terminal emulator
sudo add-apt-repository ppa:mmstick76/alacritty
sudo apt install alacritty

# cargo tools
sudo apt install cargo
cargo install skim

# snaps
sudo snap install go --classic
sudo snap install vlc

# go get
go get github.com/gokcehan/lf

# JVM development
# curl -s "https://get.sdkman.io" | bash
# source "$HOME/.sdkman/bin/sdkman-init.sh"
# sdk i gradle
# sdk i groovy
# sdk i maven
# sdk i groovyserv
# sdk i java
