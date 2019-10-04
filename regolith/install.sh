#!/usr/bin/env sh
# Regolith Linux after install script

# system
sudo apt install htop powertop tlp curl fish git exa fzf ripgrep tig meld tk tcl tldr tldr-py autojump fd-find suckless-tools asciinema

curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fis://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

# applications
sudo apt install evolution
sudo apt remove thunderbird

# dev
sudo apt install neovim nodejs yarn
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk i gradle
sdk i groovy
sdk i maven
sdk i groovyserv
sdk i java 8.0.222-librca
sdk i java 11.0.4-librca
sdk i java 12.0.2-librca
sdk i java 13.0.0-librca
