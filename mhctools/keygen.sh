#!/bin/bash
#############   CONFIG   ###########################
begin="0x008"
string="0"
end="88"
n=1000000000000
####################################################
save-keys () {
    mv $address.pem keys
    mv $address.pub keys
}
del-keys () {
    rm $address.pem
    rm $address.pub
}
i=0
while [ "$i" -lt "$n" ]; do
    address=`./metahash.sh generate | grep 'Your metahash address is' | awk -F' ' '{print $5}'`
    s=`echo $address | grep $begin | grep $string`
    if [ "$s" == "$address" ]; then
	se=$s'_END'
	e=`echo $se | grep $end'_END'`
	if [ "$e" == "$se" ]; then
	    save-keys
	    echo address=$address
	else
	    del-keys
	fi
    else
	del-keys
    fi
    i=$(($i+1))
done
