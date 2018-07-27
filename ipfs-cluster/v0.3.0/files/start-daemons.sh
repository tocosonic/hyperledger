#!/bin/sh
set -e
ipfs version

echo "=== start-daemons called ==="

if [ -e "${IPFS_PATH}/config" ]; then
  echo "== Found IPFS fs-repo at ${IPFS_PATH}"
else
  echo "== ipfs init..."
  ipfs init
  echo "==  init called"
  ipfs config Addresses.API /ip4/0.0.0.0/tcp/5001
  echo "==  api configured"
  ipfs config Addresses.Gateway /ip4/0.0.0.0/tcp/8080
  echo "==  gateway configured"
fi

echo "== calling ipfs daemon --migrate"
ipfs daemon --migrate=true & sleep 3
echo "== calling ipfs-cluster-service"
ipfs-cluster-service --version

if [ -e "${IPFS_CLUSTER_PATH}/service.json" ]; then
  echo "== Found IPFS cluster configuration at ${IPFS_CLUSTER_PATH}"
else
  echo "== calling ipfs-cluster-service init"
  ipfs-cluster-service init
  sed -i 's/127\.0\.0\.1\/tcp\/9094/0.0.0.0\/tcp\/9094/' "${IPFS_CLUSTER_PATH}/service.json"
  sed -i 's/127\.0\.0\.1\/tcp\/9095/0.0.0.0\/tcp\/9095/' "${IPFS_CLUSTER_PATH}/service.json"
fi

echo "== calling ipfs-cluster-service"
ipfs-cluster-service $@
