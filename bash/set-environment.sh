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

#'Msys' 'GNU/Linux' 'Cygwin'
OpenBSD='OpenBSD'
FreeBSD='FreeBSD'
LINUX='Linux'
MAC='Darwin'
OS=`uname | grep "${LINUX}\|Msys\|Windows\|Cyg\|${MAC}\|${FreeBSD}\|OpenBSD"`

echo "OS: ${OS}"

if [[ $OS == '' ]]; then
	echo 'The O.S. is not recognized. Choose option please:'
	echo '1. Linux'
	echo '2. OSX'
	echo '3. Windows'
	echo '4. FreeBSD'
	echo '5. OpenBSD'
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
	if [[ $Option == 4 ]]; then
		OS='FreeBSD'
	fi
	if [[ $Option == 5 ]]; then
		OS='OpenBSD'
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
	alias rm="rm -i"
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
	LINUXPATH="/home/isma/dotfiles/bash/linux.sh"

	if [ -f $LINUXPATH ]; then
		source /home/isma/dotfiles/bash/linux.sh
	else  source $HOME/dotfiles/bash/linux.sh;
	fi
}

function WindowsConfiguration()
{
	source windows.sh
}

function OSXConfiguration()
{
	#General O.S functions
	export PS1="\T|\W>"
	source  $HOME/dotfiles/bash/osx.sh
	source  $HOME/dotfiles/java/java-init.sh
}

function FreeBSDConfiguration()
{
    STARTUP="/home/ismatim/dotfiles"
	source  ${STARTUP}/freebsd/freebsd.sh
}

function OpenBSDConfiguration()
{
    STARTUP="${HOME}/dotfiles"
	source  ${STARTUP}/openbsd/openbsd.sh
}


#echo 'System is' $OS
#echo 'setting '$OS' development environment...'
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
		;;
	*"OpenBSD"*)
		OpenBSDConfiguration

esac

#echo 'Done: Loading Setting Environment.'
