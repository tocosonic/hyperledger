FROM hyperledger/fabric-orderer:x86_64-1.1.0-preview
# Prepare PVC moint points
RUN mkdir /pvc \
 && mkdir /pvc/fabric-orderer-channel-artifacts \
 && mkdir /pvc/fabric-orderer-msp \
 && mkdir /pvc/fabric-orderer-tls \
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
RUN touch /.bash_history \
 && cp /root/.bash* / \
 && chown -R :0 /.bash* \
 && chmod -R g+rw /.bash* \
 && chmod -R o+r /.bash* \
 && echo PS1=\"\\[\\w\\]\\nuser@\\h:\\\\$ \" >> \.bashrc \
 && echo cd /pvc >> /.bashrc
VOLUME /pvc/fabric-orderer-channel-artifacts
VOLUME /pvc/fabric-orderer-msp
VOLUME /pvc/fabric-orderer-tls
ENTRYPOINT []
CMD []
