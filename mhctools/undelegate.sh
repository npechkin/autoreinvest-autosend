#!/bin/bash
net=$1
address=$2
node=$3
################################################################################
torrent_node="tor.net-$net.metahashnetwork.com:5795"
proxy_node="proxy.net-$net.metahashnetwork.com:9999"
pubkey=keys/$address.pub
privkey=keys/$address.pem
string="{\"method\":\"undelegate\"}"
dataHex=`echo -n $string | xxd -ps | tr -d '\r\n'`
amount=0
./metahash.sh send-transaction --net=$net --pubkey=$pubkey --privkey=$privkey --send_to=$node --amount=$amount --dataHex=$dataHex
