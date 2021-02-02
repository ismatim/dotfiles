#!/bin/bash +xv
#**************************************************************#
#                   set-configuration.sh                       #
#           written by Ismael J. Tisminetzky                   #
#                Feb, 2017                                     #
#                                                              #
#      Set up configuration for windows dev environment.       #
#**************************************************************#


function WindowsConfiguration()
{
 
     # Set the working folder.
     WORKFOLDER="$HOME/Documents/UNIT_DATA/SOFTWARE\ TOOLS/"

     alias gotools="cd ${WORKFOLDER}"
     alias code='C:/Program\ Files\ \(x86\)/Microsoft\ VS\ Code/Code.exe'
     alias gotools="cd ${WORKFOLDER}tools"
     alias gobash="cd ${WORKFOLDER}/tools/code/bash"
     alias gobashclients="cd ${WORKFOLDER}/tools/code/bash/scripts/clients"
     alias goc="cd ${WORKFOLDER}/tools/code/c"
     alias code="C:/Program\ Files\ \(x86\)/Microsoft\ VS\ Code/Code.exe"
     alias govimconf="cd c:/Users/Ismael/.vim"
     alias gostartup="cd c:/Users/Ismael/startup"
     alias gotools="cd C:/Users/Ismael/Documents/UNIT_DATA/SOFTWARE\ TOOLS/tools"

     # Execute script for git in prompt.
     PS1="$PS1\$($(cat "${HOME}/startup/bash/git-ps1.sh"))"
}

WindowsConfiguration

