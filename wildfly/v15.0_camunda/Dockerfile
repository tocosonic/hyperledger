FROM jboss/wildfly:15.0.1.Final
USER root

RUN mkdir -p /opt/jboss/wildfly/modules/com/mysql/main
RUN mkdir -p /opt/jboss/wildfly/modules/com/mariadb/main

COPY payload/startup.sh /opt/jboss/wildfly/bin/

COPY payload/mysql/* /opt/jboss/wildfly/modules/com/mysql/main/
COPY payload/mariadb/* /opt/jboss/wildfly/modules/com/mariadb/main/
COPY payload/camunda/modules/ /opt/jboss/wildfly/modules/
COPY payload/camunda/server/wildfly-16.0.0.Final/standalone/deployments/camunda-webapp-jboss-7.11.0-alpha4.war /opt/jboss/wildfly/standalone/deployments
COPY payload/camunda/server/wildfly-16.0.0.Final/standalone/deployments/camunda-engine-rest-7.11.0-alpha4.war /opt/jboss/wildfly/standalone/deployments

#backup configuration and data
RUN cp -rf /opt/jboss/wildfly/standalone /opt/jboss/wildfly/standalone.bak

RUN chown -R :0 /opt/jboss \
 && chmod -R g+rwx /opt/jboss \
 && chmod -R o+rx /opt/jboss \
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
 && yum -y install which \
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

VOLUME /opt/jboss/wildfly/standalone/deployments
VOLUME /opt/jboss/wildfly/standalone/data
VOLUME /opt/jboss/wildfly/standalone/configuration
VOLUME /opt/jboss/wildfly/standalone/log
