# Dockerfile for the 2.3 GA version of MariaDB MaxScale
FROM ubuntu:bionic

COPY payload/maxscale.list /etc/apt/sources.list.d/maxscale.list.tmp

RUN apt-get -y update && \
    apt-get -y install gnupg2 && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys "0x135659e928c12247" && \
    mv /etc/apt/sources.list.d/maxscale.list.tmp /etc/apt/sources.list.d/maxscale.list && \
    apt-get -y update && \
    apt-get -y install maxscale && \
    rm -rf /var/lib/apt/lists/*

COPY payload/maxscale.cnf /etc/
ENTRYPOINT ["maxscale", "-d", "-U", "maxscale", "-l", "stdout"]

COPY payload/docker-entrypoint.sh /usr/local/bin/
RUN chmod 775 /usr/local/bin/docker-entrypoint.sh && \
    ln -s /usr/local/bin/docker-entrypoint.sh /docker-entrypoint.sh # backwards compat
ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["maxscale", "-d", "-U", "maxscale", "-l", "stdout"]


#FROM mariadb/maxscale:2.3
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

RUN mkdir -p /config

COPY payload/subst-vars-in-cnf.sh /

RUN chown -R :0 /run \
 && chmod -R g+rw /run \
 && chown -R :0 /var/lib \
 && chmod -R g+rw /var/lib \
 && chmod g+rwx /*.sh \
 && chown :0 /*.sh \
 && chown -R :0 /usr/local/bin \
 && chmod -R g+rw /usr/local/bin

RUN chown -R :0 /etc/ \
 && chmod -R g+rw /etc/

RUN chown -R :0 /var/cache/ \
 && chmod -R g+rw /var/cache/

RUN chown -R :0 /var/log/ \
 && chmod -R g+rw /var/log/

RUN chown -R :0 /usr/share/maxscale/ \
 && chmod -R g+rw /usr/share/maxscale/

RUN chown -R :0 /usr/bin/ \
 && chmod -R g+rw /usr/bin/

#used to mount configurations
RUN chown -R :0 /config/ \
 && chmod -R g+rw /config/

RUN echo alias ll='ls -l --color=auto' >> /etc/profile
RUN touch /.bash_history \
 && cp /root/.bash* / \
 && chown -R :0 /.bash* \
 && chmod -R g+rw /.bash* \
 && chmod -R o+r /.bash* \
 && echo PS1=\"\\[\\w\\]\\nuser@\\h:\\\\$ \" >> \.bashrc

VOLUME /config
