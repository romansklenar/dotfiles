# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="rbates"

# Example aliases
alias zshconfig="atom ~/.zshrc"
alias ohmyzsh="atom ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(rails textmate ruby bundler brew gem)
plugins=(git brew gem rbenv rails bundler postgres heroku docker vagrant pow)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

### Added by Atom command line tool
export EDITOR='atom'

### Added by Postgres.app
export PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH"

### Added by Homebrew (recommended by brew doctor)
export PATH="/usr/local/bin:$PATH"

### Added for Ruby gems
export PATH="/usr/local/opt/ruby/bin:$PATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Added by RBENV
export RBENV_ROOT="$HOME/.rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init - --no-rehash)"

### Added by Bundler: load custom scripts and binstubs
export PATH="./bin:./.bundle/bin:$HOME/.bin:$PATH"

# to load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

export PATH="$NVM_DIR:$PATH"
export ANDROID_HOME="/usr/local/opt/android-sdk"

# to load PYENV
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# to enable direnv hooks
# eval "$(direnv hook zsh)"

# update outdated packeges installed by homebrew
alias buio="brew update && brew install `brew outdated`"

# disable correction
alias vagrant="nocorrect vagrant"

# for vagrant / digital ocean
# export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt
