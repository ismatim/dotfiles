#!/bin/bash
source ~/startup/bash/set-environment.sh
source ~/startup/bash/docker.sh;

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export GPG_TTY=$(tty)
