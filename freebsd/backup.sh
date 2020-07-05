#!/usr/sbin/bash

# BACKUP LATEST CONFIGURATION

BACKUP_CONF_FOLDER="/home/ismatim/startup/bsd/"
cp /boot/loader.conf ${BACKUP_CONF_FOLDER} 
cp /etc/rc.conf ${BACKUP_CONF_FOLDER} 
