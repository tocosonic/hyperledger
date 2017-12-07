FROM hyperledger/fabric-couchdb:x86_64-1.1.0-preview
RUN chown -R :0 /opt/couchdb/
RUN chmod -R g+rwx /opt/couchdb/
RUN echo [httpd] >> /opt/couchdb/etc/local.ini; echo bind_address = 0.0.0.0 >> /opt/couchdb/etc/local.ini
RUN sed -i 's/chown.*//g' /docker-entrypoint.sh
#RUN sed -i 's/su-exec couchdb \"$@\"/$@/g' /docker-entrypoint.sh
RUN sed -i 's/su-exec couchdb \"$@\"/exec \"$@\"/g' /docker-entrypoint.sh
#ENTRYPOINT []
#CMD ["/bin/bash"]
