FROM mariadb/maxscale:2.3
#remove v2.3.4 to later install 2.3.x
RUN apt -y remove maxscale

COPY payload/maxscale.list /etc/apt/sources.list.d/maxscale.list.tmp
RUN mv -f /etc/apt/sources.list.d/maxscale.list.tmp /etc/apt/sources.list.d/maxscale.list

RUN apt-get -y update
RUN apt-get -y upgrade

RUN apt-get -y install maxscale

RUN apt-get -y install libltdl7 \
 && apt-get -y install rsync \
 && apt-get -y install nano \
 && apt-get -y install joe \
 && apt-get -y install less\
 && apt-get -y install wget \
 && apt-get -y install curl \
 && apt-get -y install procps \
 && apt-get -y install telnet

RUN apt-get -y install perl \
 && apt-get -y install perl-modules-5.26 \
 && apt-get -y install perl-openssl-defaults \
 && apt-get -y install make

RUN yes | perl -MCPAN -e install forks
RUN yes | perl -MCPAN -e install HTTPTunnelLib
RUN yes | perl -MCPAN -e install Crypt::OpenSSL::RSA

RUN cp -r /root/.cpan /
RUN mkdir -p /config
RUN mkdir -p /var/http-tunnel

COPY payload/subst-vars-in-cnf.sh /
COPY payload/http-tunnel/* /var/http-tunnel/

RUN tar xzvf /var/http-tunnel/HTTPTunnel_v1.2.1_platformindependent.tgz -C /var/http-tunnel/
RUN cp -r /var/http-tunnel/HTTPTunnel_v1.2.1/common/ /var/http-tunnel/HTTPTunnel_v1.2.1/perl/
RUN rm /var/http-tunnel/HTTPTunnel_v1.2.1_platformindependent.tgz

RUN sed -i 's/PORT = 80/PORT = 11111/g' /var/http-tunnel/HTTPTunnel_v1.2.1/perl/httptunnel_server.cfg

RUN chown -R :0 /run \
 && chmod -R g+rw /run \
 && chown -R :0 /var/lib \
 && chmod -R g+rw /var/lib \
 && chmod g+rwx /*.sh \
 && chown :0 /*.sh \
 && chown -R :0 /usr/local/bin \
 && chmod -R g+rw /usr/local/bin

RUN chown -R :0 /.cpan \
 && chmod -R g+rw /.cpan \
 && chown -R :0 /var/http-tunnel \
 && chmod -R g+rwx /var/http-tunnel

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
RUN echo export PERL5LIB=/var/http-tunnel/HTTPTunnel_v1.2.1/perl >> /.bashrc

VOLUME /config
