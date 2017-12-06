FROM hyperledger/fabric-couchdb:x86_64-1.1.0-preview
RUN chown -R couchdb:couchdb /opt/couchdb/data
RUN sed -i 's/chown.*//g' test
RUN sed -i 's/su-exec couchdb \"$@\"/$@/g' /docker-entrypoint.sh
USER couchdb
EXPOSE 5984
VOLUME /opt/couchdb/data
