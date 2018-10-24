#/bin/bash

srce='#from location'
dest='#to location'
cmd="rsync -vrpogtmh --info=progress2 --delete --exclude='.*'"

###
#
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
