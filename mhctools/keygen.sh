#!/bin/bash
#############   CONFIG   ###########################
string="0x001"
n=1000000000000
####################################################
i=0
while [ "$i" -lt "$n" ]; do
    address=`./metahash.sh generate | grep 'Your metahash address is' | awk -F' ' '{print $5}'`
    add=`echo $address | grep $string`
    if [ "$add" == "$address" ]; then
	echo address=$address
    else
	rm $address.pem
	rm $address.pub
    fi
    i=$(($i+1))
done
