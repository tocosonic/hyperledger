#!/bin/bash

cd /chaincode
cp -rf root/ application
cp -rf exchange/$CONTAINER_ID/* application/
cd application
gradle build
#gradle run -PappArgs="['-a=$CORE_PEER_CHAINCODELISTENADDRESS']"
java -jar build/chaincode.jar --peerAddress $CORE_PEER_CHAINCODELISTENADDRESS
