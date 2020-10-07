#!/bin/bash
units=3992.382
units=4222.752
units=4277.606
units=4374.23
units=4445.083
now=$((($(date +%s) - 3600*24)))
yesterday=$(date +%d/%m/%Y --date=@$now)
yesterday=`echo $yesterday | sed "s|/|\\\\\\\\/|g"`
#echo $yesterday
curl -A "Mozilla/4.0"  https://uk.virginmoney.com/fundprices/prices.csv | sed -n "/$yesterday/p"  | awk -F, '/UK Index Track/{print $3}'|sed "s/\"//g" | awk -vDT=$(date +%d/%m/%Y --date=@$now) -vUU=$units '{print DT,$NF,UU,$NF*UU}'
