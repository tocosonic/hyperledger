FROM mariadb:10.4.3
#FROM mariadb:10.3.13

RUN apt-get -y update \
 && apt-get -y upgrade \
 && apt-get -y install libltdl7 \
 && apt-get -y install rsync \
 && apt-get -y install nano \
 && apt-get -y install joe \
 && apt-get -y install less\
 && apt-get -y install procps \
 && apt-get -y install telnet

COPY payload/settings/* /etc/mysql/mariadb.conf.d/
COPY payload/docker-entrypoint.sh /openshift-entrypoint.sh

RUN mkdir -p /var/lib/mysql
RUN chown -R :0 /var/lib \
 && chmod -R g+rw /var/lib \
 && chown -R :0 /docker-entrypoint-initdb.d \
 && chmod -R g+rw /docker-entrypoint-initdb.d \
 && chown :0 /docker-entrypoint.sh \
 && chmod g+rw /docker-entrypoint.sh \
 && chown :0 /openshift-entrypoint.sh \
 && chmod g+rwx /openshift-entrypoint.sh \
 && chown -R :0 /usr/local/bin \
 && chmod -R g+rw /usr/local/bin \
 && chown -R :0 /var/run/mysqld \
 && chmod -R g+rw /var/run/mysqld \
 && chown -R :0 /etc/mysql \
 && chmod -R g+rw /etc/mysql

RUN echo alias ll='ls -l --color=auto' >> /etc/profile
RUN touch /.bash_history \
 && cp /root/.bash* / \
 && chown -R :0 /.bash* \
 && chmod -R g+rw /.bash* \
 && chmod -R o+r /.bash* \
 && echo PS1=\"\\[\\w\\]\\nuser@\\h:\\\\$ \" >> \.bashrc \
 && echo cd /var/lib/mysql >> /.bashrc

#provide a default password for the root account
ENV MYSQL_ROOT_PASSWORD secret

VOLUME /var/lib/mysql
VOLUME /config
VOLUME /status
