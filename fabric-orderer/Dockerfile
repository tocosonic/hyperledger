FROM hyperledger/fabric-orderer:x86_64-1.1.0-preview
RUN chown -R :0 /etc/hyperledger \
 && chmod -R a+w /etc/hyperledger \
 && chown -R :0 /var/hyperledger \
 && chmod -R a+w /var/hyperledger
# && chown -R :0 /opt/gopath \
# && chmod -R a+w /opt/gopath
EXPOSE 7050
VOLUME /var/hyperledger/orderer/channel-artifacts
VOLUME /var/hyperledger/orderer/msp
#WORKDIR /opt/gopath/src/github.com/hyperledger/fabric
CMD orderer start
