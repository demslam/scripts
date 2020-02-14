##/bin/bash





list='hd-list.txt' #temp file to parse through
folder='/opt/html/' #output folder for reports
se='HDsentinel'
se_loc='/root/' #location of HDsentinal
hd_loc='/dev/disk/by-label/' #location of HD

hd_len=${#hd_loc}
find $hd_loc -type l > $list

echo Start
while read p; do
    a="${p:$hd_len}"
    echo $se -dev $p -html -r $folder$a.html
    $se_loc./$se -dev $p -html -r $folder$a.html
done < $list
