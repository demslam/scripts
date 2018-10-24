#!/bin/bash

####
#By: Matt (Dem) Briggs
#Date: 2018/07/04
#Description: movies (copy) files from one folder to another and deletes unwanted file types
####

#source folder
sour=#source folder

#destination folder
dest=#destination folder

#add file extension to delete seperate via space * = wild
delete=( *.par2 *.txt *.nfo *.nzb *sample* )

#rsync copy files over
rsync -ah --progress $sour $dest

#delete unwated files in the copied directory
for i in "${delete[@]}"
do
  :
  find $dest -type f -name $i -delete
done
