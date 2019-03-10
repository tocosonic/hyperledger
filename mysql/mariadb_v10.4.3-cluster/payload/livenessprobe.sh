#!/bin/bash

OUT=/status/$HOSTNAME-live.log
touch $OUT

mysqladmin -u root -p$MYSQL_ROOT_PASSWORD ping 1>> $OUT 2>> $OUT

if [ $? -ne 0 ]; then
  echo "status not successful" >> $OUT
  exit -1
else
  echo "ok" >> $OUT
  exit 0
fi
