FROM hyperledger/fabric-orderer:x86_64-1.1.0-preview
# Prepare PVC moint points
RUN mkdir /pvc \
 && mkdir /pvc/fabric-peer01-host \
 && mkdir /pvc/fabric-peer01-fabric \
 && mkdir /pvc/fabric-peer11-host \
 && mkdir /pvc/fabric-peer11-fabric \
 && mkdir /pvc/fabric-peer02-host \
 && mkdir /pvc/fabric-peer02-fabric \
 && mkdir /pvc/fabric-peer12-host \
 && mkdir /pvc/fabric-peer12-fabric \
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
RUN echo alias ll='ls -l --color=auto' >> /etc/profile
VOLUME /pvc/fabric-peer01-host
VOLUME /pvc/fabric-peer01-fabric
VOLUME /pvc/fabric-peer02-host
VOLUME /pvc/fabric-peer02-fabric
VOLUME /pvc/fabric-peer11-host
VOLUME /pvc/fabric-peer11-fabric
VOLUME /pvc/fabric-peer12-host
VOLUME /pvc/fabric-peer12-fabric
ENTRYPOINT []
CMD []
