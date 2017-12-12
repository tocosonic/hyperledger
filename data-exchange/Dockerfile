FROM hyperledger/fabric-couchdb:x86_64-1.1.0-preview
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
 && chmod -R g+rwx /pvc \
 && chmod -R o+rx /pvc
RUN apt-get -y update \
 && apt-get -y upgrade \
 && apt-get -y install rsync \
 && apt-get -y install nano \
 && apt-get -y install joe \
 && apt-get -y install man \
 && apt-get -y install less
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
#Prepare CouchDB
RUN chown -R :0 /opt/couchdb/ \
 && chmod -R g+rwx /opt/couchdb/
RUN echo [httpd] >> /opt/couchdb/etc/local.ini; echo bind_address = 0.0.0.0 >> /opt/couchdb/etc/local.ini \
 && sed -i 's/chown.*//g' /docker-entrypoint.sh \
 && sed -i 's/su-exec couchdb \"$@\"/exec \"$@\"/g' /docker-entrypoint.sh
