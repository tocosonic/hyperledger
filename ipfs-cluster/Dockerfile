FROM ipfs/ipfs-cluster:v0.3.0

RUN mkdir -p /data/ipfs-cluster
RUN mkdir -p /data/ipfs

#copy the new startup-script
COPY files/start-daemons.sh /usr/local/bin/
COPY files/start_ipfs /usr/local/bin/

RUN chown -R :0 /data \
 && chmod -R g+rw /data \
 && chown -R :0 /usr/local/bin \
 && chmod -R g+rw /usr/local/bin

RUN echo alias ll='ls -l --color=auto' >> /etc/profile
RUN touch /.ash_history \
 && touch /.ashrc \
 && chown -R :0 /.ash* \
 && chmod -R g+rw /.ash* \
 && chmod -R o+r /.ash* \
 && echo PS1=\"\\[\\w\\]\\nuser@\\h:\\\\$ \" >> \.ashrc \
 && echo cd /etc/hyperledger >> /.ashrc

EXPOSE 9094-9096 4001/tcp 4002/udp 5001/tcp 8080-8081/tcp
VOLUME /data/ipfs
VOLUME /data/ipfs-cluster
