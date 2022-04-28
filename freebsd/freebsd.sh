
function FreeBSDConfiguration()
{

    set -o vi
    export PATH=$PATH:~/usr/local/bin
    # Declare variables.
    export TOOLSFOLDER="/tank_data_1"
    export WORKFOLDER="/tank_data_1/projects/work"

    #alias tmux="tmux -2"
    # Declare Alias
    alias gonvim="cd ~/.config/nvim"
    alias editnvim="nvim ~/.config/nvim"
    alias exa="exa --long --no-permissions --no-time --no-user --no-filesize"
    alias less="less -R"
    alias gosetup="cd ~/dotfiles/freebsd"
    alias gobash="cd ~/dotfiles/bash"
    alias godotfiles="cd ~/dotfiles/"
    alias goclients="cd ${TOOLSFOLDER}/clients"
    alias editclients="nvim ${TOOLSFOLDER}/clients/setup/setup_clients.sh"
    alias goprojects="cd ${TOOLSFOLDER}/projects"
    alias gowork="cd ${TOOLSFOLDER}/projects/work"
    alias goblog="cd ${TOOLSFOLDER}/projects/work/blog"
    alias gotools="cd ${TOOLSFOLDER}/tools/"
    alias gogit="cd ${TOOLSFOLDER}/tools/code/git"
    alias gocheat="cd ${TOOLSFOLDER}/tools/code/unix/cheats/.cheat"
    alias goc="cd ${TOOLSFOLDER}/tools/code/c"
    alias gobashex="cd ${TOOLSFOLDER}/tools/code/bash"
    alias ls="ls -ihlaG"
    alias c="clear"

    # Environment Variables
    export EDITOR="/usr/local/bin/nvim"
    #export PAGER="/usr/local/bin/nvim -f -R -"
    # Execute script for git in prompt.
    #PS1="$PS1\$($(cat "${HOME}/dotfiles/bash/scripts/git-ps1.sh"))"
	  export PS1="\T ø "
	  # export PS1="\e[3;33;40m ø\e[0;37;40m "
    source $TOOLSFOLDER/tools/code/unix/functions/grep/functions/g
    source $TOOLSFOLDER/tools/code/unix/functions/findrecursive
    source $TOOLSFOLDER/tools/code/git/functions/currentbranch
    source $TOOLSFOLDER/tools/code/git/functions/showbranches
    source $TOOLSFOLDER/tools/code/bash/scripts/functions/fzf_searches.sh

    #load clients
    source $TOOLSFOLDER/clients/setup/setup_clients.sh

    #apps
    #cheats
    export CHEAT_REPOSITORY="${TOOLSFOLDER}/tools/code/unix/cheats"

    #source /usr/local/etc/bash_completion.d/pass
    echo "run scripts for grep."
    RunFunctionsScriptsForGrep
    echo "FZF vim configuration."
    VimConfigurationPlugins

    export LANG=en_US.UTF-8
}

function RunFunctionsScriptsForGrep(){
    for SCRIPTS in $TOOLSFOLDER/code/grep/functions/*
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

function cheatpull(){
    cd ${TOOLSFOLDER}/tools/code/unix
    git pull
    cd -
}

function printCommandLine(){
   cat ${TOOLSFOLDER}/tools/code/unix/command_line_intro.md | egrep -o '`\w+`' | tr -d '`' | cowsay -W50
}

FreeBSDConfiguration
# printCommandLine
