#/bin/bash

mkdir -p /data/home/.ssh
HOME=/data/home
echo "${USER_NAME:-default}:x:$(id -u):0:${USER_NAME:-default} user:${HOME}:/sbin/nologin" >> /etc/passwd
