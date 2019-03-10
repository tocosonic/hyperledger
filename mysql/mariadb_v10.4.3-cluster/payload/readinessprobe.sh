#!/bin/bash

OUT=/status/$HOSTNAME-ready.log
touch $OUT

if [ -f /status/clusterup ]; then
  mysql -h "127.0.0.1" -u root -p$MYSQL_ROOT_PASSWORD -e "select 1" 1>> $OUT 2>> $OUT
  
  if [ $? -ne 0 ]; then
    echo "select not ok" >> $OUT
    exit -1
  else
    echo "select ok" >> $OUT
    exit 0
  fi
else
  echo "cluster not started yet" >> $OUT
  exit -2
fi
