#!/bin/bash -xv
#**************************************************************#
#                   set-configuration.sh                       #
#           written by Ismael J. Tisminetzky                   #
#                Feb, 2017                                     #
#                                                              #
#      Set up configuration for linux dev environment.         #
#**************************************************************#

function LinuxConfiguration()
{
     #TODO: change ismatim for $USER
     echo 'Configuring Linux...'

     CLIENTS="/mnt/d/UNIT_DATA/clients"
     WORKFOLDER="/mnt/d/UNIT_DATA"

     #if [ ! -d $CLIENTS ]; then
     #    CLIENTS="$HOME/Documents/clients"
     #fi

     #if [ ! -d $WORKFOLDER ]; then
     #    WORKFOLDER="$HOME/Documents/tools"
     #fi

     alias gostartup="cd ~/startup/"
     alias godocs="cd $HOME/Documents"
     alias gotools="cd $WORKFOLDER"
     alias goclients="cd $CLIENTS"
     #commands. TODO: Change to functions.
     alias ls='ls -la --color=auto -X'
     alias c="clear"
     alias apt-get="sudo apt-get"
     #set command prompt for git
     #PS1="$PS1\$($(cat /Users/ismatim/startup/bash/git-ps1.sh))"

     #load clients
     source $CLIENTS/clients-linux.sh
     source $WORKFOLDER/code/grep/functions/g
     source $WORKFOLDER/code/git/functions/currentbranch
     source $WORKFOLDER/code/git/functions/showbranches
}

LinuxConfiguration

