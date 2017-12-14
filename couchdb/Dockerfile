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
 && apt-get -y upgrade \
 && mv /opt/couchdb/etc/default.ini /opt/couchdb/etc/default.ini.bak \
 && mv /opt/couchdb/etc/local.ini /opt/couchdb/etc/local.ini.bak \
 && mv /opt/couchdb/etc/vm.args /opt/couchdb/etc/vm.args.bak
RUN echo "couchdb couchdb/mode select none" | debconf-set-selections \
 && apt-get -y upgrade couchdb
#RUN mv /opt/couchdb/etc/default.ini /opt/couchdb/etc/default.ini.new \
# && mv /opt/couchdb/etc/local.ini /opt/couchdb/etc/local.ini.new \
# && mv /opt/couchdb/etc/vm.args /opt/couchdb/etc/vm.args.new \
# && mv /opt/couchdb/etc/default.ini.bak /opt/couchdb/etc/default.ini \
# && mv /opt/couchdb/etc/local.ini.bak /opt/couchdb/etc/local.ini \
# && mv /opt/couchdb/etc/vm.args.bak /opt/couchdb/etc/vm.args

# && apt-get -y install couchdb
#Prepare folder access rights
RUN chown -R :0 /opt/couchdb/ \
 && chmod -R g+rwx /opt/couchdb/
RUN echo [httpd] >> /opt/couchdb/etc/local.ini; echo bind_address = 0.0.0.0 >> /opt/couchdb/etc/local.ini \
 && sed -i 's/chown.*//g' /docker-entrypoint.sh \
 && sed -i 's/su-exec couchdb \"$@\"/exec \"$@\"/g' /docker-entrypoint.sh
