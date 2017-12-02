FROM 2736904862db
RUN useradd --user-group --create-home ec2-user
RUN chmod a+w -R /etc/hyperledger
RUN chown -R ec2-user /etc/hyperledger
USER ec2-user
WORKDIR /home/ec2-user
EXPOSE 7054
VOLUME /etc/hyperledger/fabric-ca-server-config
VOLUME /etc/hyperledger/fabric-ca-server
CMD fabric-ca-server start --ca.name ca.org1.example.com --ca.certfile /etc/hyperledger/fabric-ca-server-config/ca.org1.example.com-cert.pem --ca.keyfile /etc/hyperledger/fabric-ca-server-config/ee6728254f19d503c2598c18ba8daa7ee36c1d3f7c400175fceca0e2e95bb0d5_sk -b admin:adminpw -d
