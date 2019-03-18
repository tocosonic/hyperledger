FROM mariadb/maxscale:2.3

#RUN rm -f /etc/apt/sources.list.d/maxscale.list

RUN apt-get -y update
RUN apt-get -y upgrade

RUN apt-get -y install libltdl7 \
 && apt-get -y install rsync \
 && apt-get -y install nano \
 && apt-get -y install joe \
 && apt-get -y install less\
 && apt-get -y install wget \
 && apt-get -y install curl \
 && apt-get -y install procps \
 && apt-get -y install telnet

#COPY payload/settings/* /etc/mysql/mariadb.conf.d/
#COPY payload/docker-entrypoint.sh /openshift-entrypoint.sh
#COPY payload/readinessprobe.sh /
#COPY payload/livenessprobe.sh /
#COPY payload/init-mariadb.sh /
#COPY payload/start-mariadb.sh /

RUN mkdir -p /config

RUN chown -R :0 /var/lib \
 && chmod -R g+rw /var/lib \
 && chmod g+rwx /*.sh \
 && chown :0 /*.sh \
 && chown -R :0 /docker-entrypoint.sh \
 && chmod -R g+rw /docker-entrypoint.sh \
 && chown -R :0 /usr/local/bin \
 && chmod -R g+rw /usr/local/bin

RUN chown -R :0 /etc/ \
 && chmod -R g+rw /etc/

#used to mount configurations
RUN chown -R :0 /config/ \
 && chmod -R g+rw /config/

RUN echo alias ll='ls -l --color=auto' >> /etc/profile
RUN touch /.bash_history \
 && cp /root/.bash* / \
 && chown -R :0 /.bash* \
 && chmod -R g+rw /.bash* \
 && chmod -R o+r /.bash* \
 && echo PS1=\"\\[\\w\\]\\nuser@\\h:\\\\$ \" >> \.bashrc \
 && echo cd /var/lib/mysql >> /.bashrc

VOLUME /etc/maxscale.d
