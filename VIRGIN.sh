#!/bin/bash
person=${1:-colin}
units=3992.382
units=4222.752
units=4277.606
units=4374.23
units=4445.083
unitsAK=95439.844
unitsAKb=9311.205
now=$((($(date +%s) - 3600*24)))
yesterday=$(date +%d/%m/%Y --date=@$now)
yesterday=`echo $yesterday | sed "s|/|\\\\\\\\/|g"`
#echo $yesterday


if [ $person = colin ]
then
curl -A "Mozilla/4.0"  https://uk.virginmoney.com/fundprices/prices.csv | sed -n "/$yesterday/p"  | awk -F, '/UK Index Track/{print $3}'|sed "s/\"//g" | awk -vDT=$(date +%d/%m/%Y --date=@$now) -vUU=$units '{print DT,$NF,UU,$NF*UU}'
  fi






if [ $person = akiko ]
then
curl -A "Mozilla/4.0"  https://uk.virginmoney.com/fundprices/prices.csv | sed -n "/$yesterday/p"  | awk -F, '/UK Index Track/{print $3}'|sed "s/\"//g" | awk -vDT=$(date +%d/%m/%Y --date=@$now) -vUU=$unitsAK '{print DT,$NF,UU,$NF*UU}'

curl -A "Mozilla/4.0"  https://uk.virginmoney.com/fundprices/prices.csv | sed -n "/$yesterday/p"  | awk -F, '/^\"Bond and Gilt/{print $3}'|sed "s/\"//g" | awk -vDT=$(date +%d/%m/%Y --date=@$now) -vUU=$unitsAKb '{print DT,$NF,UU,$NF*UU}'
fi




