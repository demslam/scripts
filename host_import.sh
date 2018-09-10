#/bin/bash

#location of static assume file is "Mac Addres","IP Address","Hostname"
static='/etc/dnsmasq.d/04-pihole-static-dhcp.conf'

#this pulls your local
l2=$(grep search /etc/resolv.conf | awk -F ' ' '{print $2}')

#Host file location
host=/etc/hosts

awk -F ',' '{print $2" "$3"'.$l2' "$3}' $static > import.list #&& cat import.list

grep -Fvxf $host import.list >> $host && cat $host
