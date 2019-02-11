#!/bin/bash

WILDFLY_BASE_DIR=/opt/jboss/wildfly
CFG_DIR=${WILDFLY_BASE_DIR}/standalone/configuration
LIB_DIR=${WILDFLY_BASE_DIR}/standalone/lib

#copy default default config if files don't exist
echo "copy default configuration data"
cp -nr ${WILDFLY_BASE_DIR}/standalone.bak/configuration/* ${CFG_DIR}/

echo "copy default libs"
cp -nr ${WILDFLY_BASE_DIR}/standalone.bak/lib/* ${LIB_DIR}

echo "start-up Wildfly..."
/opt/jboss/wildfly/bin/standalone.sh "$@"
