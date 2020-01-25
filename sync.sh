#/bin/bash

####
#By: Matt (Dem) Briggs
#Date: 2018/10/23
#A script that perfomance rsync good to use for a cron job
####

srce='#from location "end with /"'
dest='#to location'
cmd="rsync -vrpogtmh --info=progress2 --delete --exclude='.*'"

###
# rsync options
# v - verbose
# r - recurisve
# p - preserve permissions
# o - preserve owner
# g - preserve group
# t - preserve modification time
# m - prune empty directories
# h - human readable
# --delete - deletes files at $dest to match files/directories at $srce
###

echo $cmd $srce $dest
$cmd $srce $dest
