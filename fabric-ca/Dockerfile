FROM hyperledger/fabric-ca:x86_64-1.1.0
RUN chown -R :0 /etc/hyperledger \
 && chmod -R a+w /etc/hyperledger
RUN apt-get -y update \
 && apt-get -y upgrade \
 && apt-get -y install libltdl7 \
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
 && echo PS1=\"\\[\\w\\]\\nuser@\\h:\\\\$ \" >> \.bashrc
EXPOSE 7054
VOLUME /etc/hyperledger/fabric-ca-server-config
VOLUME /etc/hyperledger/fabric-ca-server
# CMD fabric-ca-server start --ca.name ca.org1.example.com --ca.certfile /etc/hyperledger/fabric-ca-server-config/ca.org1.example.com-cert.pem --ca.keyfile /etc/hyperledger/fabric-ca-server-config/ee6728254f19d503c2598c18ba8daa7ee36c1d3f7c400175fceca0e2e95bb0d5_sk -b admin:adminpw -d
