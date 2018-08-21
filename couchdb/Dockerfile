FROM hyperledger/fabric-couchdb:0.4.10

#install the most recent version of CouchDB
RUN echo "deb https://apache.bintray.com/couchdb-deb xenial main" | tee -a /etc/apt/sources.list \
 && curl -L https://couchdb.apache.org/repo/bintray-pubkey.asc | apt-key add -

RUN mv /opt/couchdb/etc/default.ini /opt/couchdb/etc/default.ini.bak \
 && mv /opt/couchdb/etc/local.ini /opt/couchdb/etc/local.ini.bak \
 && mv /opt/couchdb/etc/vm.args /opt/couchdb/etc/vm.args.bak
RUN echo "couchdb couchdb/mode select none" | debconf-set-selections

RUN apt-get -y update

RUN apt-get -y clean
RUN apt-get -y -f install
RUN dpkg --configure -a
RUN apt-get -y -f install
RUN apt -y autoremove
RUN apt-get -y dist-upgrade

RUN apt-get -y remove couchdb
RUN apt-get -y install couchdb

RUN apt-get -y update \
 && apt-get -y upgrade

RUN apt-get -y install rsync \
 && apt-get -y install nano \
 && apt-get -y install joe

RUN sed -i 's/\[couchdb\]/\[couchdb\]\n\; Specify the location of the database in container.\n\; Optionally\, these directories can be mounted in the host via docker.\ndatabase_dir \= \/opt\/couchdb\/data\/\nview_index_dir \= \/opt\/couchdb\/data\/\nuri_file \= \/opt\/couchdb\/data\/couch.uri\nmax_dbs_open \= 8000\ndelayed_commits \= true\n/' /opt/couchdb/etc/local.ini
RUN sed -i 's/\[couch_httpd_auth\]/\[couch_httpd_auth\]\niterations \= 1000 \; iterations for password hashing\n/' /opt/couchdb/etc/local.ini
RUN sed -i 's/\[chttpd\]/\[chttpd\]\nbind_address \= 0\.0\.0\.0/' /opt/couchdb/etc/local.ini
RUN sed -i 's/name couchdb\@127\.0\.0\.1/nonode\@nohost/g' /opt/couchdb/etc/vm.args
RUN echo [cluster] >> /opt/couchdb/etc/local.ini \
# peer maintains a single replica
 && echo n = 1 >> /opt/couchdb/etc/local.ini \
# adjust q to set the level of parallelism locally
# recommended to have no more than 10 million documents/shard
# for 100 million documents, q=10 -- at a minimum
 && echo q = 8 >> /opt/couchdb/etc/local.ini \
# This is a default rule for all databases:
# When database fragmentation (unused versions) reaches 30% of the total file size, the database will be compacted.
 && echo [compactions] >> /opt/couchdb/etc/local.ini \
 && echo _default = [{db_fragmentation, \"30\%\"}, {view_fragmentation, \"30\%\"}] >> /opt/couchdb/etc/local.ini \
# Database compaction settings.
# Databases will be checked every 300s
# Databases less than 256K in size will not be compacted
 && echo [compaction_daemon] >> /opt/couchdb/etc/local.ini \
 && echo check_interval = 300 >> /opt/couchdb/etc/local.ini \
 && echo min_file_size = 256000 >> /opt/couchdb/etc/local.ini \
 && echo [log] >> /opt/couchdb/etc/local.ini \
 && echo writer = file >> /opt/couchdb/etc/local.ini \
 && echo file = /opt/couchdb/logs/couchdb.log >> /opt/couchdb/etc/local.ini \
 && echo level = info >> /opt/couchdb/etc/local.ini \
 && echo [attachments] >> /opt/couchdb/etc/local.ini \
 && echo compressible_types = text/*, application/javascript, application/json, application/xml, application/octet-stream >> /opt/couchdb/etc/local.ini \
 && echo [httpd] >> /opt/couchdb/etc/local.ini \
 && echo bind_address = 0.0.0.0 >> /opt/couchdb/etc/local.ini

#Prepare folder access rights
RUN chown -R :0 /opt/couchdb/ \
 && chmod -R g+rwx /opt/couchdb/ \
 && sed -i 's/; admin = admin/;admin = mysecretpassword/' /docker-entrypoint.sh \
 && sed -i 's/chown.*//g' /docker-entrypoint.sh \
 && sed -i 's/su-exec couchdb \"$@\"/exec \"$@\"/g' /docker-entrypoint.sh

RUN echo alias ll='ls -l --color=auto' >> /etc/profile
