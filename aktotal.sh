#!/bin/bash
now=$((($(date +%s) - 3600*24)))
yesterday=$(date +%d/%m/%Y --date=@$now)
yesterday=`echo $yesterday | sed "s|/|\\\\\\\\/|g"`
before=$((($(date +%s) - 3600*24*2)))
before=$(date +%d/%m/%Y --date=@$before)
before=`echo $before | sed "s|/|\\\\\\\\/|g"`
#sed -n "/$before/p" histAK | awk -v b=$before 'BEGIN{S=0;};{S+=$4;};END{print b,"Total: ",S;}'
#sed -n "/$yesterday/p" histAK | awk -v b=$yesterday 'BEGIN{S=0;};{S+=$4;};END{print b,"Total: ",S;}'
cat histAK | awk 'BEGIN{S=0;i=0};{{S+=$4;};if(i++%3==2){print $1,"Total: ",S;S=0;}}'
