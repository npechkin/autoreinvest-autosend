#!/bin/bash
############################# SEND EXAMPLE #####################################
net=main
address=0x00_YOUR_ADDRESS
to=0x00_ADDRESS_FOR_SEND
round_to_integer=0
#./send_all.sh  $net $address $to $round_to_integer
########################### REINVEST EXAMPLE ###################################
net=main
address=0x00_YOUR_ADDRESS
node=0x00ADDRESS_OF_NODES
round_to_integer=0
#./reinvest.sh $net $address $node $round_to_integer
######################### UNDELEGATE EXAMPLE ###################################
net=main
address=0x00_YOUR_ADDRESS
node=0x00ADDRESS_OF_NODES
#./undelegate.sh $net $address $node
################################################################################
cd /root/mhctools
############################ UNDELEGATE 1 ######################################
net=main
address=0x00_YOUR_ADDRESS
node=0x00ADDRESS_OF_NODES
#./undelegate.sh $net $address $node
############################# SEND 1 ###########################################
net=main
address=
to=
round_to_integer=0
#./send_all.sh  $net $address $to $round_to_integer
############################# SEND2 ############################################
net=main
address=
to=
round_to_integer=0
#./send_all.sh  $net $address $to $round_to_integer
############################ REINVEST1 #########################################
net=main
address=
node=
round_to_integer=0
#./reinvest.sh $net $address $node $round_to_integer
############################ REINVEST2 #########################################
net=main
address=
node=
round_to_integer=0
#./reinvest.sh $net $address $node $round_to_integer
################################################################################
