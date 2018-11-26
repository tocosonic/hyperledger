#!/bin/sh

export HOME=/nodejs
cd $HOME

cp /bs-config.json $HOME/
lite-server
