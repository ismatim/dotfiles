#!/usr/local/sbin/bash

# INSTALL FREEBSD
#TODO: Install startup repository
#TODO: Install tools repository
#TODO: Install vim configurations
#TODO: Install tmux configurations
#TODO: Install & Setup mutt
#TODO: Install & Setup irsii 
#TODO: Add symlinks to home instead of copy them.
#TODO: Ask for install packages: git, tmux
#TODO: Schedule with cron backup with tar
#TODO: Install Jenkins
#TODO: Add script to have trash bin 
#TODO: Add new user for BoC
#TODO: Download secrets to .password-store

sudo pkg install git
sudo pkg install vim
sudo pkg install tmux

WORKFOLDER="/home/ismatim"
USER="ismatim"

# Repositories installation

GITHUB_URL="https://github/ismatim/"
cd $WORKFOLDER
mkdir -p tools/unix  startup

git clone  "${GITHUB_URL}/startup" "${WORKFOLDER}/startup"
git clone  "${GITHUB_URL}/tools" "${WORKFOLDER}/tools"
git clone  "${GITHUB_URL}/unix" "${WORKFOLDER}/tools/unix"

# Setup configuration for root
ln -s .config /home/ismatim/.config
ln -s .config /home/ismatim/startup/ /root/startup
ln -s  /home/${USER}/startup/ /root/startup
ln -s  /home/${USER}/.config/ /root/.config
ln -s  /home/${USER}/.bashrc  /root/.bashrc
ln -s  /home/${USER}/.vim  /root/.vim
ln -s  /home/${USER}/nvim  /root/nvim
ln -s  /home/${USER}/.tmux  /root/.tmux
ln -s  /home/${USER}/.tmux.conf  /root/.tmux.conf
ln -s  /home/${USER}/.vim  /root/.vim
ln -s  /home/${USER}/.viminfo  /root/.viminfo
ln -s  /home/${USER}/.gitconfig  /root/.gitconfig
ln -s  /home/${USER}/.git-credentials  /root/.git-credentials

# Setup local bash functions
ln -s /home/${USER}/bin /home/${USER}/startup/bash/bin
ln -s "${WORKFOLDER}/startup/bash/.bashrc" .bashrc.
ln -s "${WORKFOLDER}/startup/git/configurations/.gitconfig" .gitconfig 
ln -s "${WORKFOLDER}/startup/git/configurations/.gitignore" .gitignore
ln -s "${WORKFOLDER}/startup/git/configurations/.git-credentials" .git-credentials
ln -s /home/ismatim/startup/tmux/tmux.conf .tmux.conf
ln -s /home/ismatim/startup/bash/.bashrc .bashrc

# Custom Functions & Install cheats
CHEAT_REPOSITORY="$(WORKFOLDER)/tools/unix/cheats"


# Install ports
portsnap fetch
portsnap extract
portsnap update

## Install portmaster
pkg install portmaster
cd /usr/ports/ports-mgmt/portmaster/ && make install clean
cp /usr/local/etc/portmaster.rc.sample /usr/local/etc/portmaster.rc

# Install Xorg
portmaster x11-servers/xorg-server
portmaster x11-drivers/xorg-drivers
portmaster x11/xinit
portmaster x11/xauth
portmaster x11-fonts/xorg-fonts
portmaster x11-fonts/webfonts

portmaster x11-dwm


#TODO: Create Xorg configuration

echo "exec dwm" >> ~/.xinitrc

ln -s "${WORKFOLDER}/startup/bsd/xorg.conf" /usr/local/etc/X11/xorg.conf.d/xorg.conf

# Install browsers
portmaster www/chromium


# Create symbolic link to Python
ln -s /usr/local/bin/python3.6 /usr/local/bin/python




