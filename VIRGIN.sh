#!/bin/bash
now=$((($(date +%s) - 3600*24)))
yesterday=$(date +%d/%m/%Y --date=@$now)
yesterday=`echo $yesterday | sed "s|/|\\\\\\\\/|g"`
echo $yesterday
curl -A "Mozilla/4.0"  https://uk.virginmoney.com/fundprices/prices.csv | sed -n "/$yesterday/p" | sed "s/\"//g" | awk -F, '/UK Index Track/{print $3}'
