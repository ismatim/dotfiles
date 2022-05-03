#!/bin/sh

# osx
rsync -ahtrzvvv -e ssh  ismaeltisminetzky@cygnus:/Users/ismaeltisminetzky/UNIT_DATA/ebooks/ /tank_data_1/ebook/
rsync -ahtrzvvv -e ssh  ismaeltisminetzky@cygnus:/Users/ismaeltisminetzky/UNIT_DATA/personal/ /tank_data_1/personal/
rsync -ahtrzvvv -e ssh ismaeltisminetzky@cygnus:/Users/ismaeltisminetzky/Pictures/ /tank_data_1/photos/

# www.ismaeltisminetzky.xyz
rsync -ahtrzvvv -e ssh root@ismaeltisminetzky.xyz:/etc/ /tank_data_1/projects/openbsd/etc/
rsync -ahtrzvvv -e ssh root@ismaeltisminetzky.xyz:/root/dotfiles/ /tank_data_1/projects/openbsd/dotfiles/
rsync -ahtrzvvv -e ssh root@ismaeltisminetzky.xyz:/home/me/Maildir/ /tank_data_1/projects/openbsd/Maildir/

# local freebsd
rsync -ahtrzvvv /etc/ /tank_data_1/projects/freebsd/
rsync -ahtrzvvv /boot/ /tank_data_1/projects/freebsd/boot/
rsync -ahtrzvvv /home/ismatim/dotfiles /tank_data_1/backup/home/
rsync -ahtrzvvv /home/ismatim/.git-credentials /tank_data_1/backup/home/
rsync -ahtrzvvv /home/ismatim/.gnupg /tank_data_1/backup/home/
rsync -ahtrzvvv /home/ismatim/.ssh /tank_data_1/backup/home/
rsync -ahtrzvvv /home/ismatim/.password-store /tank_data_1/backup/home/
rsync -ahtrzvvv /home/ismatim/.config/nvim /tank_data_1/backup/home/.config/
rsync -ahtrzvvv /home/ismatim/.tmux /tank_data_1/backup/home/
