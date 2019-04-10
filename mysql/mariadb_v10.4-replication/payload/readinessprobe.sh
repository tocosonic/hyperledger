#!/bin/bash

#OUT=/status/$HOSTNAME-ready.log
#touch $OUT

  mysql -h "127.0.0.1" -u root -p$MYSQL_ROOT_PASSWORD -e "select 1"
  # 1>> $OUT 2>> $OUT
  
  if [ $? -ne 0 ]; then
#    echo "select not ok, trying root without password" >> $OUT
    
    mysql -h "127.0.0.1" -u root -e "select 1"
    # 1>> $OUT 2>> $OUT
    if [ $? -ne 0 ]; then
#      echo "select not ok, trying without user" >> $OUT
      
      mysql -h "127.0.0.1" -e "select 1"
      # 1>> $OUT 2>> $OUT
      if [ $? ne 0 ]; then
#        echo "select not ok"
        exit -1
      fi
    fi
  fi
  exit 0
  