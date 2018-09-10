#/bin/bash

####
#By: Matt (Dem) Briggs
#Date: 2018/09/10
#A file that will scrap and import static address into your hosts file
####

#location of static assume file is "Mac Addres","IP Address","Hostname"
static='/etc/dnsmasq.d/04-pihole-static-dhcp.conf'

#this pulls your local
l2=$(grep search /etc/resolv.conf | awk -F ' ' '{print $2}')

#Host file location
host=/etc/hosts

#This genrates the list of "IP Address" "Hostname+local" "Hostname"
awk -F ',' '{print $2" "$3"'.$l2' "$3}' $static > import.list #&& cat import.list

#This adds unique to your hosts file 
####
#Note this will not check for redundant IP address so if you have something with the same IP address twice there could be an issue
####
grep -Fvxf $host import.list >> $host && cat $host
