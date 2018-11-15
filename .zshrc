# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git taskwarrior)
plugins=(git zsh-autosuggestions)
source ~/.oh-my-zsh/plugins/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
#export vim=/usr/local/Cellar/vim/bin/vim
alias vim=nvim
export EDITOR=nvim
export GIT_EDITOR=nvim
export PATH="$PATH":/Users/sahebjot.singh/.local/bin

#for tmux to use 256 colors
export TERM=xterm-256color
# added psvm path for purescript
export PATH=$HOME/.psvm/current/bin:$PATH

# android sdk
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$HOME/Library/Android/sdk/tools:$PATH
export PATH=$HOME/Library/Android/sdk/platform-tools:$PATH

# haskell
export PATH=$HOME/Library/Haskell/bin:$PATH
export PATH=$HOME/.cabal/bin:$PATH

# golang
export GOPATH=$HOME/Documents/code/go
export PATH=$GOPATH/bin:$PATH

export SHELL=zsh
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# postgres
alias pg-start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
alias pg-stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# this is the armory flags
export CFLAGS="-arch x86_64"
export ARCHFLAGS="-arch x86_64"
alias ctags="`brew --prefix`/bin/ctags"
export PATH=/Users/sahebjotsingh/Documents/juspay/kube-scripts/istio-0.7.1/bin:$PATH
source $HOME/.cargo/env

# fix it later!
# alias watch="while :; do clear; date; bash -c $1; sleep 2; done"
#

# export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_171.jdk/Contents/Home
# export SPARK_HOME=$HOME/server/spark-2.3.0-bin-hadoop2.7
# export SBT_HOME=$HOME/server/spark/server/sbt
# export SCALA_HOME=$HOME/server/spark/server/scala-2.11.12

# export PATH=$JAVA_HOME/bin:$SBT_HOME/bin:$SBT_HOME/lib:$SCALA_HOME/bin:$SCALA_HOME/lib:$PATH
# export PATH=$JAVA_HOME/bin:$SPARK_HOME:$SPARK_HOME/bin:$SPARK_HOME/sbin:$PATH
# export PATH=$JAVA_HOME/bin:$SBT_HOME/lib:$SCALA_HOME/lib:$PATH
# export PATH=$SPARK_HOME:$SPARK_HOME/bin:$SPARK_HOME/sbin:$PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/sahebjotsingh/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/sahebjotsingh/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/sahebjotsingh/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/sahebjotsingh/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# font fix
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8


weather(){ curl -s "wttr.in/$1?m1"}

function count() {
  total=$1
  for ((i=total; i>0; i--)); do sleep 1; printf "Time remaining $i secs \r"; done
  echo -e "\a"
}

function repeatAndWait(){
  while true; do
    clear
    echo "running again"
    eval $2
    sleep $1
  done
}

function dialog() {
  osascript -e "tell app \"System Events\" to display dialog \"$1\""
}

# color for less and man
export MANPAGER='less -s -M +Gg'
export LESS="--RAW-CONTROL-CHARS"
lesscolors=$HOME/bin/.LESS_TERMCAP
[[ -f $lesscolors ]] && . $lesscolors

function anybar { echo -n $1 | nc -4u -w0 localhost ${2:-1738}; }

export PATH=$GOPATH/src/github.com/uber/go-torch/FlameGraph:$PATH

# aws cli autocompleter
source /usr/local/bin/aws_zsh_completer.sh

# haskell stack
export PATH=/Users/sahebjotsingh/.local/bin:$PATH
