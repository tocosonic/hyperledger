FROM bitnami/wildfly:19.1.0
#FROM jboss/wildfly:19.0.0.Final
USER root

#backup configuration and data
RUN mv -f /opt/bitnami /opt/jboss


RUN cp -rf /opt/jboss/wildfly/standalone /opt/jboss/wildfly/standalone.bak
RUN mkdir -p /opt/jboss/wildfly/modules/com/mysql/main
RUN mkdir -p /opt/jboss/wildfly/modules/com/mariadb/main

COPY payload/startup.sh /opt/jboss/wildfly/bin/
COPY payload/mysql/* /opt/jboss/wildfly/modules/com/mysql/main/
COPY payload/mariadb/* /opt/jboss/wildfly/modules/com/mariadb/main/


RUN chown -R :0 /opt \
 && chmod -R g+rwx /opt \
 && chmod -R o+rx /opt \
 && chown -R :0 /usr/lib \
 && chmod -R g+rwx /usr/lib \
 && chmod -R o+rx /usr/lib

#RUN yum-config-manager --save --setopt=base.skip_if_unavailable=true --disablerepo=extras

RUN apt-get update
RUN apt-get install -y joe
RUN apt-get install -y telnet
RUN apt-get install -y ant
RUN apt-get install -y maven
RUN apt-get install -y wget
RUN apt-get upgrade

#RUN yum -y install nano \
# && yum -y install epel-release \
# && yum -y install joe \
# && yum -y install man \
# && yum -y install telnet \
# && yum -y install rsync \
# && yum -y install ant \
# && yum -y install maven \
# && yum -y install wget \
# && yum -y install libtool-ltdl-devel \
# && yum -y install net-tools \
# && yum -y install iproute \
# && yum -y upgrade
 
RUN echo alias ll='ls -l --color=auto' >> /etc/profile
RUN touch /.bash_history \
 && cp /root/.bash* / \
 && chown -R :0 /.bash* \
 && chmod -R g+rw /.bash* \
 && chmod -R o+r /.bash* \
 && echo PS1=\"\\[\\w\\]\\nuser@\\h:\\\\$ \" >> \.bashrc \
 && echo cd /opt/jboss/wildfly >> /.bashrc

VOLUME /opt/jboss/wildfly/standalone/deployments
VOLUME /opt/jboss/wildfly/standalone/data
VOLUME /opt/jboss/wildfly/standalone/configuration
VOLUME /opt/jboss/wildfly/standalone/log
