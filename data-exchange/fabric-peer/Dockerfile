FROM hyperledger/fabric-orderer:x86_64-1.1.0-preview
# Prepare PVC moint points
RUN mkdir /pvc \
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
 && apt-get -y install less\
 && apt-get -y install telnet
VOLUME /pvc/fabric-peer01-host
VOLUME /pvc/fabric-peer01-msp
VOLUME /pvc/fabric-peer02-host
VOLUME /pvc/fabric-peer02-msp
VOLUME /pvc/fabric-peer11-host
VOLUME /pvc/fabric-peer11-msp
VOLUME /pvc/fabric-peer12-host
VOLUME /pvc/fabric-peer12-msp
ENTRYPOINT []
CMD []
