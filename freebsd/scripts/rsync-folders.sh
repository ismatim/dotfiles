#!/bin/sh
rsync -ahtrzvvv -e ssh  ismaeltisminetzky@cygnus:/Users/ismaeltisminetzky/UNIT_DATA/ebooks/ /tank_data_1/ebook/
rsync -ahtrzvvv -e ssh  ismaeltisminetzky@cygnus:/Users/ismaeltisminetzky/UNIT_DATA/personal/ /tank_data_1/personal/
rsync -ahtrzvvv -e ssh ismaeltisminetzky@cygnus:/Users/ismaeltisminetzky/Pictures/ /tank_data_1/photos/
rsync -ahtrzvvv -e ssh root@ismaeltisminetzky.xyz:/etc/ /tank_data_1/projects/openbsd/etc/
