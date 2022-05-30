#!/bin/bash
source ~/dotfiles/bash/set-environment.sh
source ~/dotfiles/bash/docker.sh;

[ -f ~/.fzf.bash ] && source ~/.fzf.bash


[[ $PS1 && -f /usr/local/share/bash-completion/bash_completion.sh ]] && \
	source /usr/local/share/bash-completion/bash_completion.sh

export GPG_TTY=$(tty)

export PIPENV_VENV_IN_PROJECT=True

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
