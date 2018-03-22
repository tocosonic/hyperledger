FROM hyperledger/fabric-zookeeper:x86_64-1.0.6
RUN chown -R :0 /data \
 && chmod -R g+w /data \
 && chown -R :0 /datalog \
 && chmod -R g+w /datalog\
 && chown -R :0 /zookeeper-3.4.9 \
 && chmod -R g+w /zookeeper-3.4.9 \
 && chown -R :0 /conf \
 && chmod -R g+w /conf \
 && sed -i 's/\"\$1\".*\=/"1" =/' /docker-entrypoint.sh \
 && echo '#/bin/bash' > /zooReady.sh \
 && echo 'if [ $(echo ruok | nc 127.0.0.1 $1) == "imok" ]; then exit 0; else exit 1; fi' >> /zooReady.sh \
 && chmod +x /zooReady.sh
RUN echo alias ll='ls -l --color=auto' >> /etc/profile
