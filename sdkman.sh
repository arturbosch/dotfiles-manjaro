#!/bin/env sh
echo "Installing sdkman"
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk i java
sdk i gradle
sdk i maven
sdk i groovy

