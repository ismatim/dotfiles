
function OSXConfiguration()
{
    export PATH=$PATH:~/usr/local/bin
    # Declare variables.
    WORKFOLDER="/Users/${USER}/UNIT_DATA"

    # Declare Alias
    alias gostartup="cd ~/startup/"
    alias gobash="cd ~/startup/bash"
    alias gotools="cd ${WORKFOLDER}/tools/"
    alias gogit="cd ${WORKFOLDER}/tools/code/git"
    alias gocheat="cd ${WORKFOLDER}/tools/code/unix/cheats/.cheat"
    alias goc="cd ${WORKFOLDER}/tools/code/c"
    alias goclients="cd ${WORKFOLDER}/clients"
    alias gobashex="cd ${WORKFOLDER}/tools/code/bash"
    alias ls="ls -laG"
    alias goenglish="cd ${WORKFOLDER}/personal/idioms/english"
    alias gosoftwareproject="cd ${WORKFOLDER}/"
    alias goreact="cd ${WORKFOLDER}/tools/code/reactjs"
    alias gonodejs="cd ${WORKFOLDER}/nodejs"
    alias govagrant="cd ${WORKFOLDER}/vagrant"
    alias c="clear"
    alias gounit="cd ${WORKFOLDER}/"
    # lock the screen
    alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
    # get ip local address
    alias localip="ipconfig getifaddr en0"
    # Environment Variables
    export EDITOR="/usr/local/bin/vim"
    export ECLIPSE_HOME="/Applications/Eclipse.app/Contents/Eclipse/"
    # Execute script for git in prompt.
    PS1="$PS1\$($(cat "${HOME}/startup/bash/scripts/git-ps1.sh"))"

    #source $WORKFOLDER/tools/code/linux/functions/grep/functions/g
    #source $WORKFOLDER/tools/code/linux/functions/findrecursive
    source $WORKFOLDER/tools/code/git/functions/currentbranch
    source $WORKFOLDER/tools/code/git/functions/showbranches
    source $WORKFOLDER/tools/code/bash/scripts/functions/fzf_searches.sh

    #load clients
    #source $WORKFOLDER/clients/clients.sh

   #load projects 
    source $WORKFOLDER/clients/clients.sh

    #apps
    #source /usr/local/etc/bash_completion.d/pass
    RunFunctionsScriptsForGrep
    VimConfigurationPlugins

    #fzf
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
    export FZF_DEFAULT_COMMAND='ag -g ""'
    #nvim needs set locale
    export LC_ALL=en_US.UTF-8
}

OSXConfiguration
