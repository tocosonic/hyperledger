#!/bin/bash

COUCHDB_BASE_DIR=/opt/couchdb
CFG_DIR=${COUCHDB_BASE_DIR}/etc

#copy default default config if files don't exist
if [ -z "$(ls -A $CFG_DIR)"  ]; then
  echo "copy default configuration data"
  cp -rf ${COUCHDB_BASE_DIR}/etc.bak/* ${CFG_DIR}/
  chown -R :0 ${CFG_DIR}/*
fi

echo "start-up CouchDB..."
/docker-entrypoint.sh "$@"
