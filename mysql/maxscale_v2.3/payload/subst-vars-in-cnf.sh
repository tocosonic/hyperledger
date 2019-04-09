#!/bin/bash

#parameter 1: name of the cnf file

CNF=$1

if [ -z $CNF ]; then
  echo "ERROR: missing name of cnf file"
  exit -1
fi

#get vars out of cnf-file
VARS=$(grep -io "\$[a-zA-Z0-9_]\+" $CNF)

#now iterate across those vars and replace this var in the cnf file
#ignore variables without value
for VAR in $VARS; do
  var=$VAR
  value=${VAR@P}
  
  if [ ! -z $value ]; then
    sed -ix 's|'"$var"'|'"$value"'|' $CNF
  fi
done

