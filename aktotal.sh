#!/bin/bash
now=$((($(date +%s) - 3600*24)))
yesterday=$(date +%d/%m/%Y --date=@$now)
yesterday=`echo $yesterday | sed "s|/|\\\\\\\\/|g"`
echo $yesterday
sed -n "/$yesterday/p" histAK | awk 'BEGIN{S=0;}{S+=$4;}END{print "Total: ",S;}'
