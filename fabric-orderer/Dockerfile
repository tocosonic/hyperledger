FROM hyperledger/fabric-orderer:x86_64-1.1.0-preview
RUN mkdir /scripts \
 && chown -R :0 /scripts \
 && chmod -R a+w /scripts \
 && chown -R :0 /etc/hyperledger \
 && chmod -R a+w /etc/hyperledger \
 && chown -R :0 /var/hyperledger \
 && chmod -R a+w /var/hyperledger
EXPOSE 7050
VOLUME /var/hyperledger/orderer/channel-artifacts
VOLUME /var/hyperledger/orderer/msp
VOLUME /etc/hyperledger/fabric
VOLUME /scripts
CMD orderer start
