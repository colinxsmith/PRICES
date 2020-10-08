#!/bin/bash
now=$((($(date +%s) - 3600*24)))
yesterday=$(date +%d/%m/%Y --date=@$now)
yesterday=`echo $yesterday | sed "s|/|\\\\\\\\/|g"`
#sed -n "/$yesterday/p" histAK | awk 'BEGIN{S=0;};{S+=$4;};END{print "Total: ",S;}'
cat histAK | awk 'BEGIN{S=0;};{S+=$4;};END{print $1,"Total: ",S;}'
