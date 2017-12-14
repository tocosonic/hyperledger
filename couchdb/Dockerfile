FROM hyperledger/fabric-couchdb:x86_64-1.1.0-preview
#Perform a system upgrade
RUN apt-get -y update \
 && apt-get -y upgrade \
 && apt-get -y install rsync \
 && apt-get -y install nano \
 && apt-get -y install joe
#install the most recent version of CouchDB
RUN echo "deb https://apache.bintray.com/couchdb-deb xenial main" | tee -a /etc/apt/sources.list \
 && curl -L https://couchdb.apache.org/repo/bintray-pubkey.asc | apt-key add -
RUN apt-get -y update \
 && apt-get -y upgrade
# && apt-get -y install couchdb
#Prepare folder access rights
RUN chown -R :0 /opt/couchdb/ \
 && chmod -R g+rwx /opt/couchdb/
RUN echo [httpd] >> /opt/couchdb/etc/local.ini; echo bind_address = 0.0.0.0 >> /opt/couchdb/etc/local.ini \
 && sed -i 's/chown.*//g' /docker-entrypoint.sh \
 && sed -i 's/su-exec couchdb \"$@\"/exec \"$@\"/g' /docker-entrypoint.sh
