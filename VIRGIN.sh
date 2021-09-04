#!/bin/bash
person=${1:-colin}
units=3992.382
units=4222.752
units=4277.606
units=4374.23
units=4445.083
units=4499.932
units=4544.927
units=8357.198
unitsAKi=95439.844
unitsAKb=9311.205
unitsAKp=12786.471
unitsAKb=9350.377
unitsAKp=12944.242
unitsAKi=97649.029
unitsAKb=9383.757
unitsAKp=13073.666
unitsAKi=99535.841
now=$((($(date +%s) - 3600*24)))
yesterday=$(date +%d/%m/%Y --date=@$now)
yesterday=`echo $yesterday | sed "s|/|\\\\\\\\/|g"`
#echo $yesterday

if [ $person = colin ]
then
curl -A "Mozilla/4.0"  https://uk.virginmoney.com/fundprices/prices.csv | sed -n "/$yesterday/p"  | awk -F, '/\"Global Share Fund/{print $3}'|sed "s/\"//g" | awk -vDT=$(date +%d/%m/%Y --date=@$now) -vUU=$units '{print DT,$NF,UU,$NF*UU}'
  fi






if [ $person = akiko ]
then
curl -A "Mozilla/4.0"  https://uk.virginmoney.com/fundprices/prices.csv | sed -n "/$yesterday/p"  | awk -F, '/UK Index Track/{print $3}'|sed "s/\"//g" | awk -vDT=$(date +%d/%m/%Y --date=@$now) -vUU=$unitsAKi '{print DT,$NF,UU,$NF*UU}'
curl -A "Mozilla/4.0"  https://uk.virginmoney.com/fundprices/prices.csv | sed -n "/$yesterday/p"  | awk -F, '/UK Index Track/{print $3}'|sed "s/\"//g" | awk -vDT=$(date +%d/%m/%Y --date=@$now) -vUU=$unitsAKp '{print DT,$NF,UU,$NF*UU}'

curl -A "Mozilla/4.0"  https://uk.virginmoney.com/fundprices/prices.csv | sed -n "/$yesterday/p"  | awk -F, '/^\"Bond and Gilt/{print $3}'|sed "s/\"//g" | awk -vDT=$(date +%d/%m/%Y --date=@$now) -vUU=$unitsAKb '{print DT,$NF,UU,$NF*UU}'
fi




