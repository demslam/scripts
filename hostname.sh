#!/bin/bash
###
#by: Matt "dem" Briggs
#date: 2022/01/02
#desc: change hostname based on lead and last 6 of mac address
###

echo "What is your leading name for host?"
read lead
echo " "
echo "Available network interfaces"
ls /sys/class/net
echo " "
echo "What network device should we use for final mac address?"
read dev
last6='cat /sys/class/net/$dev/address | sed 's/://g' | rev | sed 's/.//7g' | rev'
mac=$(eval "$last6")

echo $lead$mac > /etc/hostname
echo " "
echo "change /etc/hostname to:"
cat /etc/hostname

awk '!/127.0.1.1/' /etc/hosts > hosts.temp
mv /etc/hosts /etc/hosts.old
echo " "
echo -e "127.0.1.1      " >> hosts.temp $lead$mac >> hosts.temp
mv hosts.temp /etc/hosts
echo " "
echo "/etc/hosts have been update to:"
cat /etc/hosts
