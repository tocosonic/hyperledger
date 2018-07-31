#!/bin/bash

WILDFLY_BASE_DIR=/opt/jboss/wildfly
CFG_DIR=${WILDFLY_BASE_DIR}/standalone/configuration
DATA_DIR=${WILDFLY_BASE_DIR}/standalone/data

#copy default data and default config if files don't exist
if [ -z "$(ls -A $CFG_DIR)"  ]; then
  echo "copy default configuration data"
  cp -rf ${WILDFLY_BASE_DIR}/standalone.bak/configuiration ${CFG_DIR}/
fi
if [ -z "$(ls -A $DATA_DIR)" ]; then
  echo "copy default data"
  cp -rf ${WILDFLY_BASE_DIR}/standalone.bak/data ${DATA_DIR}/
fi

echo "start-up Wildfly..."
/opt/jboss/wildfly/bin/standalone "$@"
