#!/bin/bash

cd /chaincode
cp -rf root/ application
cp -rf exchange/$CONTAINER_ID/* application/
cd application
gradle run
