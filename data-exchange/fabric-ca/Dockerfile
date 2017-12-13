FROM hyperledger/fabric-orderer:x86_64-1.1.0-preview
# Prepare PVC moint points
RUN mkdir /pvc \
 && mkdir /pvc/fabric-ca1-server \
 && mkdir /pvc/fabric-ca1-server-config \
 && mkdir /pvc/fabric-ca2-server \
 && mkdir /pvc/fabric-ca2-server-config \
 && chown -R :0 /pvc \
 && chmod -R g+rwx /pvc \
 && chmod -R o+rx /pvc
RUN apt-get -y update \
 && apt-get -y upgrade \
 && apt-get -y install rsync \
 && apt-get -y install nano \
 && apt-get -y install joe \
 && apt-get -y install less\
 && apt-get -y install telnet
VOLUME /pvc/fabric-ca1-server
VOLUME /pvc/fabric-ca1-server-config
VOLUME /pvc/fabric-ca2-server
VOLUME /pvc/fabric-ca2-server-config
ENTRYPOINT []
CMD []
