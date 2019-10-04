function fish_greeting
end

# paths
set -Ux JAVA_HOME $HOME/.sdkman/candidates/java/current
set -Ux JENKINS_HOME /var/lib/jenkins

## add application paths
set PATH $JAVA_HOME/bin $HOME/bin $HOME/.local/bin $HOME/.yarn/bin $HOME/.gem/ruby/2.6.0/bin $PATH

set SSH_KEY_PTH $HOME/.ssh/rsa_id

# vars
set LANG en_US.UTF-8
set EDITOR nvim
set VISUAL nvim

# aliases && abbreveations
abbr e $EDITOR
abbr vim nvim

## config shortcuts
abbr ef "$EDITOR $HOME/git/dotfiles/fish/abosch.fish"
abbr ei "$EDITOR $HOME/git/dotfiles/i3/config"
abbr ev "$EDITOR $HOME/git/dotfiles/nvim/init.vim"
abbr eg "$EDITOR $HOME/git/dotfiles/.gitconfig"
abbr ecoc "$EDITOR $HOME/git/dotfiles/nvim/coc-settings.json"

## other shortcuts
abbr gl tig
abbr loc "tokei -f --sort=lines"
abbr md "mkdir -pv"
abbr rd "rm -R"
abbr nf "clear && neofetch"
abbr g "gradle"
abbr gw "./gradlew"
abbr gv "gradle -v"
abbr gdeps "gradle -q dependencies --configuration implementation"
abbr gb "gradle build"
abbr gcb "gradlew clean build"
abbr gbp "gradlew build publishToMavenLocal"
abbr gd "gradlew detekt"
abbr f "cd ~/files && ls ~/files/ | dmenu -l 30"
abbr eff "$EDITOR (cd ~/.config/fish/functions && ls | dmenu -l 30)"
abbr ff "cat (cd ~/files && ls ~/files/ | dmenu -l 30)"
abbr fm "mplayer -geometry 25%:25% -loop 0 -fixed-vo -nofs -xineramascreen 1 -playlist (cd ~/Music/playlists && ls ~/Music/playlists | dmenu -l 30)"
abbr fe "$EDITOR (cd ~/files && ls ~/files/ | dmenu -l 30)"
abbr j "java"
abbr jj "java -jar"
abbr jv "java -version"
abbr asp "create_playlist"
abbr fixpacman "rm /var/lib/pacman/db.lck"

# pacman
abbr p "sudo pacman"
abbr pmi "sudo pacman -S"
abbr pms "pacman -Ss"
abbr pmr "sudo pacman -Rns"
abbr pmu "sudo pacman -Syu"
abbr pmq "pacman -Qe"
abbr pmold "pacman -Qdt"
abbr pmrold "sudo pacman -Sc"

# ls replacement
alias ls exa
alias ll "exa --long --git -@"
alias lt "exa --tree"

# misc aliases
alias dl "youtube-dl -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0"
alias jshell "$JAVA_HOME/bin/jshell"
alias mm "java -jar -Xmx50m ~/tools/mm.jar"
alias mmx "java -XX:TieredStopAtLevel=1 -XX:CICompilerCount=1 -XX:+UseSerialGC -Xshare:on -XX:-UsePerfData -Xmx20m -Xms20m -jar ~/tools/mm.jar"

# ruby
# echo "gem: --user-install" >> ~/.gemrc
set GEM_HOME $HOME/.gem

# js npm stuff
export NODE_PATH=$HOME/node_modules/
alias create-react-app=$NODE_PATH/create-react-app/index.js

# go
set GOPATH $HOME/go

# additional functions

## shows weather
function weather
    set city Bremen
    if test (count $argv) -eq 1
        set city $argv[1]
    end
    curl -4 http://wttr.in/$city
end

alias wetter weather

## creates a playlist from files in current directory
function create_playlist
    set homeDir $HOME/Music/playlists
    set count (count $argv)
    echo $count
    if test $count = 0
        echo "Usage: [directory name] [playlist name] (playlist is stored in ($HOME/Music/playlists)"
    else if test $count = 1
        set plistName $argv[1]
        find (pwd -P) -maxdepth 1 -type f -iregex ".*\.\(aac\|flac\|mp3\|ogg\|wav\)\$" | sort > $homeDir/$plistName
    else
        echo "Usage: [directory name] [playlist name] (playlist is stored in ($HOME/Music/playlists)"
    end
end

## fzf git add support
bind \cga git-add-fzf
bind -M insert \cga git-add-fzf
function git-add-fzf
    git add (git ls-files --modified --exclude-standard | fzf --ansi --no-sort --preview 'git diff --color=always -- {}')
end


