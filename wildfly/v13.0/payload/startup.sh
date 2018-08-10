#!/bin/bash

WILDFLY_BASE_DIR=/opt/jboss/wildfly
CFG_DIR=${WILDFLY_BASE_DIR}/standalone/configuration

#copy default default config if files don't exist
echo "copy default configuration data"
cp -nr ${WILDFLY_BASE_DIR}/standalone.bak/configuration/* ${CFG_DIR}/

echo "start-up Wildfly..."
/opt/jboss/wildfly/bin/standalone.sh "$@"
