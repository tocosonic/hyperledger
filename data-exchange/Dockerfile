FROM centos:latest
# Prepare PVC moint points
RUN mkdir /pvc \
 && mkdir /pvc/couchdb1-data \
 && mkdir /pvc/couchdb2-data \
 && mkdir /pvc/couchdb3-data \
 && mkdir /pvc/couchdb4-data \
 && mkdir /pvc/zookeeper-data \
 && mkdir /pvc/zookeeper-datalog \
 && mkdir /pvc/fabric-ca1-server \
 && mkdir /pvc/fabric-ca1-server-config \
 && mkdir /pvc/fabric-ca2-server \
 && mkdir /pvc/fabric-ca2-server-config \
 && mkdir /pvc/fabric-orderer11-genesis-block \
 && mkdir /pvc/fabric-orderer11-msp \
 && mkdir /pvc/fabric-orderer12-genesis-block \
 && mkdir /pvc/fabric-orderer12-msp \
 && mkdir /pvc/fabric-orderer21-genesis-block \
 && mkdir /pvc/fabric-orderer21-msp \
 && mkdir /pvc/fabric-orderer22-genesis-block \
 && mkdir /pvc/fabric-orderer22-msp \
 && mkdir /pvc/fabric-peer01-host \
 && mkdir /pvc/fabric-peer01-msp \
 && mkdir /pvc/fabric-peer11-host \
 && mkdir /pvc/fabric-peer11-msp \
 && mkdir /pvc/fabric-peer02-host \
 && mkdir /pvc/fabric-peer02-msp \
 && mkdir /pvc/fabric-peer12-host \
 && mkdir /pvc/fabric-peer12-msp \
 && chown -R :0 /pvc \
 && chmod -R g+rwx /pvc
RUN yum -y install nano \
 && yum -y install epel-release \
 && yum -y install joe \
 && yum -y install man \
 && yum -y install telnet
VOLUME /pvc/couchdb1-data
VOLUME /pvc/couchdb2-data
VOLUME /pvc/couchdb3-data
VOLUME /pvc/couchdb4-data
VOLUME /pvc/zookeeper-data
VOLUME /pvc/zookeeper-datalog
VOLUME /pvc/fabric-ca1-server
VOLUME /pvc/fabric-ca1-server-config
VOLUME /pvc/fabric-ca2-server
VOLUME /pvc/fabric-ca2-server-config
VOLUME /pvc/fabric-orderer11-genesis-block
VOLUME /pvc/fabric-orderer11-msp
VOLUME /pvc/fabric-orderer12-genesis-block
VOLUME /pvc/fabric-orderer12-msp
VOLUME /pvc/fabric-orderer21-genesis-block
VOLUME /pvc/fabric-orderer21-msp
VOLUME /pvc/fabric-orderer22-genesis-block
VOLUME /pvc/fabric-orderer22-msp
VOLUME /pvc/fabric-peer01-host
VOLUME /pvc/fabric-peer01-msp
VOLUME /pvc/fabric-peer02-host
VOLUME /pvc/fabric-peer02-msp
VOLUME /pvc/fabric-peer11-host
VOLUME /pvc/fabric-peer11-msp
VOLUME /pvc/fabric-peer12-host
VOLUME /pvc/fabric-peer12-msp
