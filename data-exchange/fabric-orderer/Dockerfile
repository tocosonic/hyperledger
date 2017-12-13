FROM hyperledger/fabric-orderer:x86_64-1.1.0-preview
# Prepare PVC moint points
RUN mkdir /pvc \
 && mkdir /pvc/fabric-orderer11-channel-artifacts \
 && mkdir /pvc/fabric-orderer11-msp \
 && mkdir /pvc/fabric-orderer12-channel-artifacts \
 && mkdir /pvc/fabric-orderer12-msp \
 && mkdir /pvc/fabric-orderer21-channel-artifacts \
 && mkdir /pvc/fabric-orderer21-msp \
 && mkdir /pvc/fabric-orderer22-channel-artifacts \
 && mkdir /pvc/fabric-orderer22-msp \
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
VOLUME /pvc/fabric-orderer11-channel-artifacts
VOLUME /pvc/fabric-orderer11-msp
VOLUME /pvc/fabric-orderer12-channel-artifacts
VOLUME /pvc/fabric-orderer12-msp
VOLUME /pvc/fabric-orderer21-channel-artifacts
VOLUME /pvc/fabric-orderer21-msp
VOLUME /pvc/fabric-orderer22-channel-artifacts
VOLUME /pvc/fabric-orderer22-msp
ENTRYPOINT []
CMD []
