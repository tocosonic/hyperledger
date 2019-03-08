#!/bin/bash

mysqladmin -u root -p$MYSQL_ROOT_PASSWORD ping

if [ $? -ne 0 ]; then
  echo "ping not successful"
  exit -1
else
  echo "ok"
  exit 0
fi
