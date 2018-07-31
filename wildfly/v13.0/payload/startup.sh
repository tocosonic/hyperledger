#!/bin/bash

WILDFLY_BASE_DIR=/opt/jboss/wildfly
CFG_DIR=${WILDFLY_BASE_DIR}/standalone/configuration

#copy default default config if files don't exist
if [ -z "$(ls -A $CFG_DIR)"  ]; then
  echo "copy default configuration data"
  cp -rf ${WILDFLY_BASE_DIR}/standalone.bak/configuration/* ${CFG_DIR}/
fi

echo "start-up Wildfly..."
/opt/jboss/wildfly/bin/standalone.sh "$@"
