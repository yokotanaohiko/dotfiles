
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

plugins=(brew bundler capistrano coffee command-not-found extract gem git git-flow github heroku history history-substring-search lein mvn node npm osx pip python rails rails3 rake rbenv redis-cli rsync ruby svn thor urltools vagrant vi-mode vundle yum)
source $ZSH/oh-my-zsh.sh

# Customize to your needs...
source $HOME/.zshrc.custom


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
