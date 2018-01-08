FROM hyperledger/fabric-tools:x86_64-1.1.0-preview
RUN chown -R :0 /opt/gopath \
 && chmod -R a+w /opt/gopath
RUN apt-get -y update
#RUN apt-get -y --ignore-missing dist-upgrade
RUN apt-get -y install nano \
 && apt-get -y install joe \
 && apt-get -y install less\
 && apt-get -y install telnet
#RUN apt-get -y --ignore-missing dist-upgrade
#RUN apt-get -y --ignore-missing dist-upgrade
RUN cp /root/.bash* / \
 && touch /.bash_history \
 && chown -R :0 /.bash* \
 && chmod -R g+rw /.bash* \
 && chmod -R o+r /.bash* \
 && echo PS1=\"[\\\\h \\\\W]\\\\$ \" >> /.bashrc \
 && echo alias ll='ls -l --color=auto' >> /etc/profile 
VOLUME /opt/gopath/src/github.com/hyperledger/fabric/examples/chaincode/
VOLUME /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/
VOLUME /opt/gopath/src/github.com/hyperledger/fabric/peer/scripts/
VOLUME /opt/gopath/src/github.com/hyperledger/fabric/peer/channel-artifacts/
WORKDIR /opt/gopath/src/github.com/hyperledger/fabric/peer
