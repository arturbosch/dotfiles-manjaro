echo "Installing sdkman(zip, unzip)"
inst unzip
inst zip
curl -s "https://get.sdkman.io" | bash

source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk i java
sdk i gradle
sdk i maven
sdk i groovy

echo "Installing git"
inst git
inst youtube-dl