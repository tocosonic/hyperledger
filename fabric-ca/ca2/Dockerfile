FROM hyperledger/fabric-ca:x86_64-1.1.0-preview
RUN mkdir /scripts \
 && chown -R :0 /etc/hyperledger \
 && chmod -R a+w /etc/hyperledger \
 && chown -R :0 /scripts \
 && chmod -R a+w /scripts
RUN apt-get -y update \
 && apt-get -y upgrade \
 && apt-get -y install rsync \
 && apt-get -y install nano \
 && apt-get -y install joe \
 && apt-get -y install less\
 && apt-get -y install telnet
RUN echo alias ll='ls -l --color=auto' >> /etc/profile
EXPOSE 7054
VOLUME /etc/hyperledger/fabric-ca-server-config
VOLUME /etc/hyperledger/fabric-ca-server
VOLUME /scripts
CMD fabric-ca-server start --ca.name ca.org2.example.com --ca.certfile /etc/hyperledger/fabric-ca-server-config/ca.org2.example.com-cert.pem --ca.keyfile /etc/hyperledger/fabric-ca-server-config/ce55620355d5cd8da69085fb851ab650e2f55661a595f21f45e1e537fd57fda6_sk -b admin:adminpw -d
