#!/bin/bash

if [ -f /status/clusterup ]; then
  mysql -h $HOSTNAME.${APPLICATION_NAME}-ss.$PROJECT_NAMESPACE.svc -u root -p$MYSQL_ROOT_PASSWORD -e "select 1"
  
  if [ $? -ne 0 ]; then
    echo "select not ok"
    exit -1
  else
    echo "select ok"
    exit 0
  fi
else
  echo "cluster not started yet"
  exit -2
fi
