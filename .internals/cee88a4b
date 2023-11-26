# Setting the paths.
PATH=/usr/local/lib/node_modules/node/bin:$PATH
PATH=$HOME/.local/bin:$PATH
PATH=$HOME/go/bin:$PATH
PATH=$HOME/.cargo/bin/:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.zsh/ohmyzsh/ohmyzsh"
export ZNAP="$HOME/.zsh/znap"

# Download Znap, if it's not there yet.
[[ -f $ZNAP/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git $ZNAP

source $ZNAP/znap.zsh # Start Znap

# `znap source` automatically downloads and starts your plugins.
znap source ohmyzsh/ohmyzsh
znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting
znap source laggardkernel/zsh-thefuck

# source $HOME/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# `znap eval` caches and runs any kind of command output for you.
znap eval iterm2 'curl -fsSL https://iterm2.com/shell_integration/zsh'

# `znap function` lets you lazy-load features you don't always need.
znap function _pyenv pyenv 'eval "$( pyenv init - --no-rehash )"'
compctl -K    _pyenv pyenv

ZSH_THEME="robbyrussell"

source $ZSH/oh-my-zsh.sh

# Aliases
alias c="clear"
alias so="source $HOME/.zshrc"
alias rail="rails"
alias v="nvim"
alias v.="nvim ."
alias awsl="aws --endpoint-url=http://localhost:4566"
alias cxml="sed -i -e 's/^.*\] //g' -e 's/u003c/\</g' -e 's/u003e/\>/g'"

# Ubuntu aliases.
alias update="sudo apt update"
alias upgrade="sudo apt full-upgrade -y"
alias install="sudo apt install -y"
alias remove="sudo apt remove -y"
alias purge="sudo apt purge -y"
alias autoremove="sudo apt autoremove -y"

# Typos
alias cd.="cd .."
alias cd..="cd .."

# Setting editors.
export EDITOR="nvim"
export VISUAL="nvim"

# ssh startup.
eval $(ssh-agent) &>/dev/null
ssh-add ~/.ssh/github &>/dev/null
ssh-add ~/.ssh/saloodo &>/dev/null

# nvm
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/home/adam/.bun/_bun" ] && source "/home/adam/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
