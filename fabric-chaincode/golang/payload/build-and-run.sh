#!/bin/bash

# param 1: source file = chaincode-id-path

if [ -z $1 ] ; then
  echo MISSING PARAMETER
  echo "Parameter 1: Please pass the filename of the chaincode source file (e.g. chaincode_example02.go)"
  exit -1
fi

go build -o /chaincode/bin/chaincode /chaincode/exchange/$CONTAINER_ID/$1 
/chaincode/bin/chaincode -peer.address=$CORE_PEER_CHAINCODELISTENADDRESS
