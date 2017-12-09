FROM hyperledger/fabric-ca:x86_64-1.1.0-preview
RUN chown -R :0 /etc/hyperledger \
 && chmod -R a+w /etc/hyperledger
EXPOSE 7054
VOLUME /etc/hyperledger/fabric-ca-server-config
VOLUME /etc/hyperledger/fabric-ca-server
CMD fabric-ca-server start --ca.name ca.org1.example.com --ca.certfile /etc/hyperledger/fabric-ca-server-config/ca.org1.example.com-cert.pem --ca.keyfile /etc/hyperledger/fabric-ca-server-config/ee6728254f19d503c2598c18ba8daa7ee36c1d3f7c400175fceca0e2e95bb0d5_sk -b admin:adminpw -d
