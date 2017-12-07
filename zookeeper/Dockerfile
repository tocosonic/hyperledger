FROM hyperledger/fabric-zookeeper:x86_64-1.1.0-preview
RUN chown -R :0 /data
RUN chmod -R g+w /data
RUN chown -R :0 /datalog
RUN chmod -R g+w /datalog
RUN chown -R :0 /zookeeper-3.4.9
RUN chmod -R g+w /zookeeper-3.4.9
RUN chown -R :0 /conf
RUN chmod -R g+w /conf
RUN sed -i 's/\"\$1\".*\=/"1" =/' /docker-entrypoint.sh
