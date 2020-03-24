FROM quay.io/wildfly/wildfly-centos7
USER root

#backup configuration and data
RUN cp -rf /opt/wildfly/standalone /opt/wildfly/standalone.bak
RUN mkdir -p /opt/wildfly/modules/com/mysql/main
RUN mkdir -p /opt/wildfly/modules/com/mariadb/main

COPY payload/startup.sh /opt/wildfly/bin/
COPY payload/mysql/* /opt/wildfly/modules/com/mysql/main/
COPY payload/mariadb/* /opt/wildfly/modules/com/mariadb/main/


RUN chown -R :0 /opt \
 && chmod -R g+rwx /opt \
 && chmod -R o+rx /opt \
 && chown -R :0 /usr/lib \
 && chmod -R g+rwx /usr/lib \
 && chmod -R o+rx /usr/lib

RUN yum-config-manager --save --setopt=base.skip_if_unavailable=true --disablerepo=extras \
 && yum -y install nano \
 && yum -y install epel-release \
 && yum -y install joe \
 && yum -y install man \
 && yum -y install telnet \
 && yum -y install rsync \
 && yum -y install ant \
 && yum -y install maven \
 && yum -y install wget \
 && yum -y install libtool-ltdl-devel \
 && yum -y install net-tools \
 && yum -y install iproute \
 && yum -y upgrade
 
RUN echo alias ll='ls -l --color=auto' >> /etc/profile
RUN touch /.bash_history \
 && cp /root/.bash* / \
 && chown -R :0 /.bash* \
 && chmod -R g+rw /.bash* \
 && chmod -R o+r /.bash* \
 && echo PS1=\"\\[\\w\\]\\nuser@\\h:\\\\$ \" >> \.bashrc \
 && echo cd /opt/jboss >> /.bashrc

VOLUME /opt/wildfly/standalone/deployments
VOLUME /opt/wildfly/standalone/data
VOLUME /opt/wildfly/standalone/configuration
VOLUME /opt/wildfly/standalone/log
