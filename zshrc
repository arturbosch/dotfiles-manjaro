# If you come from bash you might have to change your $PATH.
export JAVA_HOME=$HOME/.sdkman/candidates/java/current
export PATH=$JAVA_HOME/bin:$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/abosch/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="refined"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration
export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
alias micro="/home/abosch/Tools/micro $ARGS"
export VISUAL="micro"
export EDITOR="micro"
alias e=micro

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# config files aliases
alias zc="~/.zshrc"
alias omzc="~/.oh-my-zsh"
alias i3c="~/.config/i3/config"

# tools
alias ls="exa"
alias ll="exa --long --git"
alias lt="exa --tree"
# alias grep="echo Run: rg"  # ripgrep
alias find="echo Run: fd"
alias loc=tokei -f --sort=lines
alias mnt1="udisksctl mount -b /dev/sda1"
alias mnt2="udisksctl mount -b /dev/sdb1"
alias fzfupdate="cd ~/.fzf && git pull && ./install"
alias gw="./gradlew $ARGS"
alias gv="gradle -v | rg 'Gradle' | awk '{print \$2}'"
alias gwu="./gradlew wrapper --distribution-type=all --gradle-version=$(gv)"
alias d="kitty +kitten diff"
alias disks="lsblk"
alias m="mpd & ncmpcpp"
alias mkd="mkdir -pv"
alias nf="clear && neofetch"
 
# git aliases
export _git=/usr/bin/git
alias g=$_git
alias git="echo Run: g"
alias gs="$_git status -sb"
alias gsh="$_git show"
alias gb="$_git branch"
alias gf="$_git fetch"
alias gc="$_git commit"
alias gca="$_git commit --amend"
alias gcan="$_git commit --amend --no-edit"
alias gco="$_git checkout"
alias gcl="$_git checkout --theirs"  # Use local file
alias gcr="$_git checkout --ours"    # Use remote file
alias gd="$_git diff"
alias gdc="$_git diff --cached"
alias gl=tig
alias gcp="$_git cherry-pick"
alias gcpc="$_git cherry-pick --continue"
alias gp="$_git push"
function gpo() { $_git push --set-upstream origin $($_git rev-parse --abbrev-ref HEAD) }
alias gpf="$_git push --force-with-lease"
alias gsl="$_git submodule update --init --recursive"
alias gsr="$_git submodule update --init --remote --recursive"
alias gundo="$_git reset HEAD^ --"
alias ga="$_git add"
alias gr="$_git rebase"
alias grc="$_git rebase --continue"

# pacman aliases
alias p="sudo pacman"
alias pmi='sudo pacman -S $ARGS'
alias pmr='sudo pacman -R $ARGS'
alias pmu='sudo pacman -Syu $ARGS'

# source additional tools
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source $HOME/Tools/zjump/zjump.zsh
alias z="j $ARGS"

source "$HOME/.sdkman/bin/sdkman-init.sh"
source "$HOME/.prc"

# functions

function repair_zsh_history() {
	mv .zsh_history .zsh_history_bad
	strings .zsh_history_bad > .zsh_history
	fc -R .zsh_history
}
