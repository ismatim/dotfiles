#!/bin/bash
source ~/dotfiles/bash/set-environment.sh
source ~/dotfiles/bash/docker.sh;

[ -f ~/.fzf.bash ] && source ~/.fzf.bash


[[ $PS1 && -f /usr/local/share/bash-completion/bash_completion.sh ]] && \
	source /usr/local/share/bash-completion/bash_completion.sh

export GPG_TTY=$(tty)

export PIPENV_VENV_IN_PROJECT=True
