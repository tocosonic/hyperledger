FROM hyperledger/fabric-ca:x86_64-1.1.0-preview
RUN chown -R :0 /etc/hyperledger \
 && chmod -R a+w /etc/hyperledger
EXPOSE 7054
VOLUME /etc/hyperledger/fabric-ca-server-config
VOLUME /etc/hyperledger/fabric-ca-server
CMD fabric-ca-server start --ca.name ca.org2.example.com --ca.certfile /etc/hyperledger/fabric-ca-server-config/ca.org2.example.com-cert.pem --ca.keyfile /etc/hyperledger/fabric-ca-server-config/ce55620355d5cd8da69085fb851ab650e2f55661a595f21f45e1e537fd57fda6_sk -b admin:adminpw -d
