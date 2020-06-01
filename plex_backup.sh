#/bin/bash

####
#By: Matt (Dem) Briggs
#Date: 2020/06/01
#Backup plex server items and Tautulli items
####

plexsrc='/var/lib/plexmediaserver/Library/Application Support/Plex Media Server'
dest='#to location'
cmd='tar -czvf plex-backup.tar.gz $plexsrc'

echo "Plex backup and restore script"
echo -n "Backup or restore?"
read opt
echo "$opt selected"
