FROM postgres:10

RUN apt-get -y update \
 && apt-get -y upgrade \
 && apt-get -y install libltdl7 \
 && apt-get -y install rsync \
 && apt-get -y install nano \
 && apt-get -y install joe \
 && apt-get -y install less\
 && apt-get -y install procps \
 && apt-get -y install telnet

RUN mkdir -p /var/run/postgresql \
 && mkdir -p /var/lib/postgresql

COPY payload/entrypoint.sh /
COPY payload/initdb.sh /

RUN chmod +x /initdb.sh \
 && chmod +x /entrypoint.sh
RUN /initdb.sh postgres

RUN chown -R :0 /var/lib \
 && chmod -R g+rw /var/lib \
 && chown :0 /entrypoint.sh \
 && chmod +x /entrypoint.sh \
 && chmod g+rw /entrypoint.sh \
 && chown :0 /docker-entrypoint.sh \
 && chmod g+rw /docker-entrypoint.sh \
 && chown -R :0 /usr/local/bin/docker-entrypoint.sh \
 && chmod -R g+rw /usr/local/bin/docker-entrypoint.sh \
 && chown -R :0 /var/run/postgresql \
 && chmod -R g+rw /var/run/postgresql \
 && chown -R :0 /usr/lib/postgresql \
 && chmod -R g+rw /usr/lib/postgresql

RUN cd /var/lib/postgresql \
 && mv data data.init \
 && cd -

RUN echo alias ll='ls -l --color=auto' >> /etc/profile
RUN touch /.bash_history \
 && cp /root/.bash* / \
 && chown -R :0 /.bash* \
 && chmod -R g+rw /.bash* \
 && chmod -R o+r /.bash* \
 && echo PS1=\"\\[\\w\\]\\nuser@\\h:\\\\$ \" >> \.bashrc \
 && echo cd /var/lib/postgresql >> /.bashrc

VOLUME /var/lib/postgresql/data
