# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="refined"

# Override prompt in this theme
PROMPT="%3~ %(?.%F{green}.%F{red})❯%f "


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=14

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails chruby git textmate ruby lighthouse nvm nvm-auto)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git brew gem rails bundler postgres heroku docker kubectl completion zsh)

# zstyle :omz:plugins:ssh-agent agent-forwarding on

source $ZSH/oh-my-zsh.sh

# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

#### User configuration ####

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='code'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# SSH
# export SSH_KEY_PATH="~/.ssh/rsa_id"

### Added for coreutils / GNU commands
# export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
# export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

### Added by Postgres.app
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

### Added by Visual Studio Code
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

### Added by Homebrew (recommended by brew doctor)
export PATH="/usr/local/bin:$PATH"

### Added for Ruby gems
export PATH="/usr/local/opt/ruby/bin:$PATH"

### Compile ruby using jemalloc instead of malloc (make sure you have jemalloc installed on your system)
# export RUBY_CONFIGURE_OPTS="--with-jemalloc"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Added by RBENV
export RBENV_ROOT="$HOME/.rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init - --no-rehash)"

# assuming that rbenv was installed to `~/.rbenv`
FPATH=~/.rbenv/completions:"$FPATH"
autoload -U compinit
compinit

### Added by chruby
# source $HOMEBREW_PREFIX/opt/chruby/share/chruby/chruby.sh

### Added by Helm
# export HELM_HOME="$(helm home)"

### Added by Bundler: load custom scripts and binstubs
export PATH="./.bundle/bin:$HOME/.bin:$PATH"

# to load NVM
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# autoload nvm from .nvmrc file when entering directory
# nvm_auto_switch
# export PATH="$NVM_DIR:$PATH"
# export ANDROID_HOME="/usr/local/opt/android-sdk"

# to load n for managing node versions
export N_PREFIX=$HOME/.n
export PATH=$N_PREFIX/bin:$PATH

# to load PYENV
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# poetry
export PATH="$HOME/.local/bin:$PATH"

# to enable direnv hooks
# eval "$(direnv hook zsh)"

# for vagrant / digital ocean
# export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.bin" ] ; then
    PATH="$HOME/.bin:$PATH"
fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"

# update outdated packeges installed by homebrew
alias buio="brew update && brew install `brew outdated`"

# alias default Python version to Python 3
alias python=python3

# fuzzy search
source <(fzf --zsh)

# file search
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }

# interactive process killing
function pkill() {
  ps aux | fzf --height 40% --layout=reverse --prompt="Select process to kill: " | awk '{print $2}' | xargs -r sudo kill
}

# mkdir and cd
function mkcd() { mkdir -p "$@" && cd "$_"; }

# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/roman/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/roman/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
# if [ -f '/Users/roman/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/roman/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# Heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/roman/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

# Shortcut to open with Visual Studio Code
function code {
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        local argPath="$1"
        [[ $1 = /* ]] && argPath="$1" || argPath="$PWD/${1#./}"
        open -a "Visual Studio Code" "$argPath"
    fi
}

### Avvoka specific settings

# allows to skip Vite build output from logs, to keep the noise down.
export VITE_RUBY_HIDE_BUILD_CONSOLE_OUTPUT=true

# mysql/mariadb client
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/mysql-client/lib"
export CPPFLAGS="-I/opt/homebrew/opt/mysql-client/include"

# for cli_tools
export PATH="/Users/roman/Projects/avvoka/cli_tools/bin:$PATH"

# skip yarn git hooks in Avvoka app repo
export SKIP_SIMPLE_GIT_HOOKS="1"
