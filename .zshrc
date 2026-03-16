# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions)

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
## Alias section
alias c="clear"
alias cp="cp -i"                                                # Confirm before overwriting something
alias dfh='df -h'                                                # Human-readable sizes
alias free='free -m'                                            # Show sizes in MB
alias cat='bat'
alias vi='nvim'
alias ls='exa'
alias ll='exa -alh'
alias tree='exa --tree'
alias rg='ranger'
alias zz='z -'
alias py='python3'

alias src='source ~/.zshrc'

alias ff="fastfetch"
alias mhost="sudo nvim /etc/hosts"
alias xc="xclip -sel clip"

alias cj='pbpaste | perl -0777 -pe "s/\r\n?/\n/g; s/[ \t]*\n+[ \t]*/, /g; s/\t+/ /g; s/^\s+|\s+$//g" | pbcopy'

alias creq="composer require"

alias pa="php artisan"
alias pas="php artisan serve"
alias pam="php artisan migrate"
alias pat="php artisan tinker"
alias pam:f="php artisan migrate:fresh"
alias pads="php artisan db:seed"
alias pam:r1="php artisan migrate:rollback --step=1"

alias nrs="npm run start"
alias nr="npm run"

alias ga.="git add ."
alias gam="git add . && git commit -m"
alias gcm="git commit -m"
alias gpo="git push origin"
alias gpull='git pull origin'
alias gdiff='git diff --name-only'
alias gpoh="git push origin HEAD"
alias gc="git checkout"
alias gc.="git checkout ."
alias gfa="git fetch &&"
alias g-="git checkout -"
alias glogm="git log --pretty=format:'%s' -n 10 | sed -E 's/^UW-[0-9]+[[:space:]]+//'"
alias blp82="brew unlink php && brew link php@8.2" 
alias blp8="brew unlink php@8.2 && brew link php"

killport() {
  if [ -z "$1" ]; then
    echo "Usage: killport <port>"
    return 1
  fi

  local port="$1"
  local pids

  pids=$(lsof -ti :"$port")

  if [ -z "$pids" ]; then
    echo "No process found on port $port"
    return 0
  fi

  echo "Process(es) using port $port:"
  echo "----------------------------------------"
  lsof -i :"$port" -P -n
  echo "----------------------------------------"

  read "?Force kill these process(es)? (y/N): " confirm
  if [[ "$confirm" =~ ^[Yy]$ ]]; then
    kill -9 $pids
    echo "Killed process(es): $pids"
  else
    echo "Aborted."
  fi
}

# zoxide (smart cd replacement)
eval "$(zoxide init zsh)"

# Java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-8.jdk/Contents/Home

# Hadoop
export HADOOP_HOME=~/softwarica/lib/hadoop-3.3.6
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
export PATH=$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$PATH

# Spark
export SPARK_HOME=~/softwarica/lib/spark-3.5.8-bin-hadoop3
export PATH=$SPARK_HOME/bin:$PATH

# Hive
export HIVE_HOME=~/softwarica/lib/hive
export PATH=$HIVE_HOME/bin:$PATH
