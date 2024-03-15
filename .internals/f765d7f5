# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
	# include .bashrc if it exists
	if [ -f "$HOME/.bashrc" ]; then
		. "$HOME/.bashrc"
	fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
	PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
	PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.config/nvm/" ]; then
	export NVM_DIR="$HOME/.config/nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh" # This loads nvm
fi

if [ -d "$HOME/.bun" ]; then
	export BUN_INSTALL="$HOME/.bun"
	export PATH="$BUN_INSTALL/bin:$PATH"
	# bun completions
	[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"
fi

# Setting the paths.
PATH=/usr/local/lib/node_modules/node/bin:$PATH
PATH=$HOME/.local/bin:$PATH
PATH=$HOME/go/bin:$PATH
PATH=$HOME/.cargo/bin/:$PATH

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
