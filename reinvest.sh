#!/bin/bash
net=$1
address=$2
node=$3
round_to_integer=$4
################################################################################
torrent_node="tor.net-$net.metahashnetwork.com:5795"
proxy_node="proxy.net-$net.metahashnetwork.com:9999"
pubkey=keys/$address.pub
privkey=keys/$address.pem
sleep 3
curl -s -X POST --data '{"id":1,"method":"fetch-balance","params":{"address":"'$address'"}}' $torrent_node | jq '.' > data/$address.json
spent=`cat data/$address.json | jq '.result.spent'`
received=`cat data/$address.json | jq '.result.received'`
balance1=$(($received-$spent))
if [ "$round_to_integer" = "1" ]; then
    balance1=$(($balance1/1000000*1000000))
fi
echo "balance1=$balance1"
if [ "$balance1" -gt "0" ]
then
    string="{\"method\":\"undelegate\"}"
    dataHex=`echo -n $string | xxd -ps | tr -d '\r\n'`
    amount=0
    ./metahash.sh send-transaction --net=$net --pubkey=$pubkey --privkey=$privkey --send_to=$node --amount=$amount --dataHex=$dataHex
    sleep 3
    curl -s -X POST --data '{"id":1,"method":"fetch-balance","params":{"address":"'$address'"}}' $torrent_node | jq '.' > data/$address.json
    spent=`cat data/$address.json | jq '.result.spent'`
    received=`cat data/$address.json | jq '.result.received'`
    balance2=$(($received-$spent))
    if [ "$round_to_integer" = "1" ]; then
	balance2=$(($balance2/1000000*1000000))
    fi
    string="{\"method\":\"delegate\",\"params\":{\"value\":\"$balance2\"}}"
    dataHex=`echo -n $string | xxd -ps | tr -d '\r\n'`
    amount=0
    echo "balance2=$balance2"
    if [ "$balance2" -gt "0" ]
    then
	sleep 1
	./metahash.sh send-transaction --net=$net --pubkey=$pubkey --privkey=$privkey --send_to=$node --amount=$amount --dataHex=$dataHex
    fi
fi
