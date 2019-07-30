#!/bin/bash

ecpriv=$1
if [ "$ecpriv" = "" ]
then
    echo "USE: ./keygen.sh 0x00_your_key_from_metagate.ec.priv"
else
    test -f keys/$ecpriv
    exist=$?
    if [ "$exist" == "1" ]
    then
	echo "File keys/$ecpriv not exist!"
    else
	address=`echo $ecpriv | awk -F'.' '{print $1}'`
	echo $address
	./metahash.sh dec-private-key --net=main --ecpriv=keys/$address.ec.priv
	cp mh.pem keys/$address.pem
	rm mh.pem
	./metahash.sh gen-public-key --net=main --privkey=keys/$address.pem
	cp mh.pub keys/$address.pub
	rm mh.pub
    fi
fi
