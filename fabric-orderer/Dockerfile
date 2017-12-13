FROM hyperledger/fabric-orderer:x86_64-1.1.0-preview
RUN chown -R :0 /etc/hyperledger \
 && chmod -R a+w /etc/hyperledger \
 && chown -R :0 /var/hyperledger \
 && chmod -R a+w /var/hyperledger
EXPOSE 7050
VOLUME /var/hyperledger/orderer/channel-artifacts
VOLUME /var/hyperledger/orderer/msp
VOLUME /etc/hyperledger/fabric
CMD orderer start
