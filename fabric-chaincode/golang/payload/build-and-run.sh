#!/bin/bash

cd /chaincode
go build -o /chaincode/bin/chaincode ./exchange/$CONTAINER_ID
/chaincode/bin/chaincode -peer.address=$CORE_PEER_CHAINCODELISTENADDRESS
