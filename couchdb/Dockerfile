FROM hyperledger/fabric-couchdb:x86_64-1.1.0-preview
RUN chown -R :0 /opt/couchdb/
RUN chmod -R a+w /opt/couchdb/
RUN sed -i 's/chown.*//g' /docker-entrypoint.sh
RUN sed -i 's/su-exec couchdb \"$@\"/$@/g' /docker-entrypoint.sh
ENTRYPOINT []
CMD ["/bin/bash"]
