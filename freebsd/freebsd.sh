
function FreeBSDConfiguration()
{

    set -o vi
    export PATH=$PATH:~/usr/local/bin
    # Declare variables.
    export WORKFOLDER="/usr/home/${USER}"

    #alias tmux="tmux -2"
    # Declare Alias
    alias gosetup="cd ${WORKFOLDER}/startup/freebsd"
    alias gostartup="cd ${WORKFOLDER}/startup/"
    alias gobash="cd ~/startup/bash"
    alias gotools="cd ${WORKFOLDER}/tools/"
    alias gogit="cd ${WORKFOLDER}/tools/code/git"
    alias gocheat="cd ${WORKFOLDER}/tools/code/unix/cheats/.cheat"
    alias goc="cd ${WORKFOLDER}/tools/code/c"
    alias goclients="cd ${WORKFOLDER}/projects/clients"
    alias gobashex="cd ${WORKFOLDER}/tools/code/bash"
    alias ls="ls -ihlaG"
    alias c="clear"
  
    # Environment Variables
    export EDITOR="/usr/local/bin/nvim"
    #export PAGER="/usr/local/bin/nvim -f -R -"
    # Execute script for git in prompt.
    #PS1="$PS1\$($(cat "${HOME}/startup/bash/scripts/git-ps1.sh"))"

    source $WORKFOLDER/tools/code/unix/functions/grep/functions/g
    source $WORKFOLDER/tools/code/unix/functions/findrecursive
    source $WORKFOLDER/tools/code/git/functions/currentbranch
    source $WORKFOLDER/tools/code/git/functions/showbranches
    source $WORKFOLDER/tools/code/bash/scripts/functions/fzf_searches.sh

    #load clients
    source $WORKFOLDER/projects/clients/clients.sh

    #apps
    #cheats
    export CHEAT_REPOSITORY="${WORKFOLDER}/tools/code/unix/cheats"

    #source /usr/local/etc/bash_completion.d/pass
    echo "run scripts for grep."
    RunFunctionsScriptsForGrep
    echo "FZF vim configuration."
    VimConfigurationPlugins

    export LANG=en_US.UTF-8
}

function RunFunctionsScriptsForGrep(){
    for SCRIPTS in $WORKFOLDER/code/grep/functions/*
    do
        if [ -f $SCRIPT -a -x $SCRIPT ]
        then
            echo " running script $SCRIPT.."
            $SCRIPT
        fi
    done
}

#fzf
function VimConfigurationPlugins(){
    #export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
    export FZF_DEFAULT_COMMAND=' (git ls-tree -r --name-only HEAD || find . -path "*/\.*" -prune -o -type f -print -o -type l -print | sed s/^..//) 2> /dev/null'
}


FreeBSDConfiguration
