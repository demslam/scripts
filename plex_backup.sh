#/bin/bash
####
#By: Matt (Dem) Briggs
#Date: 2020/06/01
#Backup plex server items and Tautulli items
####

plexsrc='/var/lib/plexmediaserver/Library/Application Support/Plex Media Server'
tautsrc='/opt/Tautulli'
dest='#to location'
d=$(date +%Y%m%d%H%M%S)
d1="date"
cmd=$(tar -czvf plex-backup-$d.tar.gz $plexsrc')

echo "Plex backup and restore script"
echo -n "Backup or restore?"
read opt
echo "$opt selected"
echo $cmd1

#!/bin/bash

####
#By: Matt (Dem) Briggs Date: 2020/06/01 Backup plex server items and Tautulli items
####
plexsrc='/var/lib/plexmediaserver/Library/Application Support/Plex Media Server'
tautsrc='/opt/Tautulli'
dest='#to location'
d=$(date +%Y%m%d%H%M%S)
d1="date"
cmd=$(tar -czvf plex-backup-$d.tar.gz $plexsrc')
cmd1=$(touch plex-backup-$d.tar.gz)
echo "Plex backup and restore script"
echo
#read opt
#echo "$opt selected"
$cmd

