FROM hyperledger/fabric-peer:x86_64-1.1.0-preview
RUN mkdir /host \
 && mkdir /scripts \
 && chown -R :0 /host \
 && chmod -R a+w /host \
 && chown -R :0 /scripts \
 && chmod -R a+w /scripts \
 && chown -R :0 /etc/hyperledger \
 && chmod -R a+w /etc/hyperledger \
 && chown -R :0 /var/hyperledger \
 && chmod -R a+w /var/hyperledger
EXPOSE 7051 7052 7053
VOLUME /host/var/run
VOLUME /etc/hyperledger/fabric
VOLUME /scripts
#WORKDIR /opt/gopath/src/github.com/hyperledger/fabric/peer
CMD peer node start
