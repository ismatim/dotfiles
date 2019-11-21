#!/bin/bash +xv
#run source set-configuration.sh

#**************************************************************#
#                   set-configuration.sh                       #
#           written by Ismael J. Tisminetzky                   #
#                August 24, 2016                               #
#                                                              #
#      Set up configuration for development environment.       #
#**************************************************************#

#TODO:Load this from .bashrc
#TODO:Create tag #Begin

#General O.S functions
export PS1="\T|\W>"

#'Msys' 'GNU/Linux' 'Cygwin'
LINUX='Linux'
MAC='Darwin'
OS=`uname | grep "${LINUX}\|Msys\|Windows\|Cyg\|${MAC}"`

if [[ $OS == '' ]]; then
 echo 'The O.S. is not recognized. Choose option please:'
 echo '1. Linux'
 echo '2. OSX'
 echo '3. Windows'
 read Option
 if [[ $Option == 1 ]]; then
  OS='Linux'
 fi
 if [[ $Option == 2 ]]; then
  OS='Darwin'
 fi
 if [[ $Option == 3 ]]; then
  OS='Windows'
 fi
fi

function GeneralConfiguration()
{
     alias ..='cd ..'
     alias ...='cd ../../../'
     alias ....='cd ../../../../'
     alias .....='cd ../../../../'
     alias .4='cd ../../../../'
     alias .5='cd ../../../../..'
     alias ll='ls -l'
     alias ls='ls -la' 
     alias cd..="cd .."
     alias grep="grep -n --color"
     alias weather="curl http://wttr.in"
     #avoid delete massive.
     #alias rm="rm -i"
 }

function LinuxConfiguration()
{
     source /home/isma/startup/bash/linux.sh
}

function WindowsConfiguration()
{
     source ../bash/windows.sh
}

function OSXConfiguration()
{
     source  ../bash/osx.sh
}

echo 'System is' $OS
echo 'setting '$OS' development environment...'
GeneralConfiguration

case $OS in
    *"Linux"*)
        LinuxConfiguration
        ;;
    'Msys'|'Windows'|'Cyg')
        WindowsConfiguration
        ;;
    *"Darwin"*)
        OSXConfiguration
        ;;
esac

echo 'Done: Loading Setting Environment.'
