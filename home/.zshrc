# Source .profile
. ~/.profile

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.zsh/ohmyzsh/ohmyzsh"
export ZNAP="$HOME/.zsh/znap"
if [[ -f /mnt/c/Program\ Files\ (x86)/Microsoft/Edge/Application/msedge.exe ]]; then
    export BROWSER=/mnt/c/Program\ Files\ (x86)/Microsoft/Edge/Application/msedge.exe
elif [[ -f /usr/bin/google-chrome-stable ]]; then
    export BROWSER=/usr/bin/google-chrome-stable
elif [[ -f /usr/bin/firefox ]]; then
    export BROWSER=/usr/bin/firefox
fi

# Download Znap, if it's not there yet.
[[ -f $ZNAP/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git $ZNAP

source $ZNAP/znap.zsh # Start Znap

# `znap source` automatically downloads and starts your plugins.
znap source ohmyzsh/ohmyzsh
znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-autosuggestions

# `znap eval` caches and runs any kind of command output for you.
znap eval iterm2 'curl -fsSL https://iterm2.com/shell_integration/zsh'

# `znap function` lets you lazy-load features you don't always need.
znap function _pyenv pyenv 'eval "$( pyenv init - --no-rehash )"'
compctl -K    _pyenv pyenv

ZSH_THEME="robbyrussell"

source $ZSH/oh-my-zsh.sh

# ssh startup.
eval $(ssh-agent) &>/dev/null
if [ -f "$HOME/.ssh/github" ]; then
    ssh-add $HOME/.ssh/github &>/dev/null
fi

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/home/adam/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/home/adam/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
