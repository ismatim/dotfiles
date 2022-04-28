
function OpenBSDConfiguration()
{
    set -o vi
    export PATH=$PATH:~/usr/local/bin
    # Declare variables.
    export WORKFOLDER="/home/${USER}"

    PS1="\[\033[1;44m\]\T ø [\033[0m\]"
    #PS1="\[\033[1;44m\]\u|\W\[\033[0m\] "
    export XTERM=xterm-256-color
    alias tmux="tmux -2"
    # Declare Alias
    alias gostartup="cd ~/startup/"
    alias gobash="cd ~/startup/bash"
    alias gotools="cd ${WORKFOLDER}/tools/"
    alias gogit="cd ${WORKFOLDER}/tools/code/git"
    alias gocheat="cd ${WORKFOLDER}/tools/code/unix/cheats/.cheat"
    alias goc="cd ${WORKFOLDER}/tools/code/c"
    alias goclients="cd ${WORKFOLDER}/clients"
    alias gobashex="cd ${WORKFOLDER}/tools/code/bash"
    alias ls="ls -la"
    alias gosoftwareproject="cd ${WORKFOLDER}/"
    alias goreact="cd ${WORKFOLDER}/tools/code/reactjs"
    alias gonodejs="cd ${WORKFOLDER}/nodejs"
    alias c="clear"
    alias gounit="cd ${WORKFOLDER}/"
    # lock the screen
    # get ip local address
    # Environment Variables
    export EDITOR="/usr/local/bin/vim"
    # Execute script for git in prompt.

    #apps
    #cheats
    export CHEAT_REPOSITORY="${WORKFOLDER}/tools/code/unix/cheats"

    echo "run scripts for grep."
    RunFunctionsScriptsForGrep
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

function VimConfigurationPlugins(){
    export FZF_DEFAULT_COMMAND=' (git ls-tree -r --name-only HEAD || find . -path "*/\.*" -prune -o -type f -print -o -type l -print | sed s/^..//) 2> /dev/null'
}


OpenBSDConfiguration
