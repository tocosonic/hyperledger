FROM hyperledger/fabric-kafka:0.4.10
RUN chown -R :0 /opt/kafka/ \
 && chmod -R g+rwx /opt/kafka/
RUN echo alias ll='ls -l --color=auto' >> /etc/profile

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install rsync \
 && apt-get -y install nano \
 && apt-get -y install joe \
 && apt-get -y install less\
 && apt-get -y install telnet
