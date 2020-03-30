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
BSD='FreeBSD'
LINUX='Linux'
MAC='Darwin'
OS=`uname | grep "${LINUX}\|Msys\|Windows\|Cyg\|${MAC}\|${BSD}"`

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
	alias lh='ls  -lh'
	alias ls='ls -la'
	alias cd..="cd .."
	alias grep="grep -n --color"
	alias weather="curl http://wttr.in"
	alias ghome="cd ~"
	alias path='echo -e ${PATH//:/\\n}'
	#avoid delete massive.
	#alias rm="rm -i"
	#avoid conflict with tmux.
	bind '"\C-p": beginning-of-line'

     # History Time
     export HISTTIMEFORMAT="%d/%m/%y %T "
     # color for man command
     export LESS_TERMCAP_mb=$'\e[1;32m'
     export LESS_TERMCAP_md=$'\e[1;32m'
     export LESS_TERMCAP_me=$'\e[0m'
     export LESS_TERMCAP_se=$'\e[0m'
     export LESS_TERMCAP_so=$'\e[01;33m'
     export LESS_TERMCAP_ue=$'\e[0m'
     export LESS_TERMCAP_us=$'\e[1;4;31m'
}

function LinuxConfiguration()
{
	#the case for ubuntu in windows 10.
	LINUXPATH="/home/isma/startup/bash/linux.sh"

	if [ -f $LINUXPATH ]; then
		source /home/isma/startup/bash/linux.sh
	else  source $HOME/startup/bash/linux.sh;
	fi
}

function WindowsConfiguration()
{
	source windows.sh
}

function OSXConfiguration()
{
	source  $HOME/startup/bash/osx.sh
	source  $HOME/startup/java/java-init.sh
}

function FreeBSDConfiguration()
{
    STARTUP="/home/ismatim/startup"
	source  ${STARTUP}/bash/freebsd.sh
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
	*"FreeBSD"*)
		FreeBSDConfiguration
esac

echo 'Done: Loading Setting Environment.'
