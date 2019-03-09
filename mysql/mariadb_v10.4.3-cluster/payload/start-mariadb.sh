#!/bin/bash

# if command starts with an option, prepend mysqld
if [ "${1:0:1}" = '-' ]; then
  set -- mysqld "$@"
fi

#if the cluster was already started, skip the initialization methods and simply start mysqld
if [ ! -f /status/clusterup ]; then

  echo "###### cluster not started yet ######"

  if [ ! -f /status/initdone ]; then
    echo "###### init not done yet - exiting ######"
    exit -1
  else
    echo "###### doing a regular master-start-up ######"
    CLUSTERSTART=--wsrep_new_cluster


    set -- "$@" $CLUSTERSTART
    echo "using startup parameters $@"

    touch /status/clusterup
    exec "$@"
  fi

else
  echo "###### doing a regular slave-start-up ######"
  echo "  cluster was already started... If this is not true anymore, remove the file /status/clusterup"

  # if command starts with an option, prepend mysqld
  if [ "${1:0:1}" = '-' ]; then
    set -- mysqld "$@"
  fi

  exec "$@"
fi
