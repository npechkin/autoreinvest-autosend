#!/bin/bash
net=$1
address=$2
to=$3
round_to_integer=$4
string=""
################################################################################
dataHex=`echo -n $string | xxd -ps | tr -d '\n'`
pubkey=keys/$address.pub
privkey=keys/$address.pem
torrent_node="tor.net-$net.metahashnetwork.com:5795"
proxy_node="proxy.net-$net.metahashnetwork.com:9999"
sleep 3
curl -s -X POST --data '{"id":1,"method":"fetch-balance","params":{"address":"'$address'"}}' $torrent_node | jq '.' > data/$address.json
spent=`cat data/$address.json | jq '.result.spent'`
received=`cat data/$address.json | jq '.result.received'`
amount=$(($received-$spent))
echo balance=$amount
if [ "$amount" -gt "0" ]
then
    ./metahash.sh send-transaction --net=$net --pubkey=$pubkey --privkey=$privkey --send_to=$to --amount=$amount --dataHex=$dataHex
fi
