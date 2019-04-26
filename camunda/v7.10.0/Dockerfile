FROM camunda/camunda-bpm-platform:wildfly-7.10.0
USER root

#backup configuration and data
#RUN cp -rf /opt/jboss/wildfly/standalone /opt/jboss/wildfly/standalone.bak
#RUN mkdir -p /opt/jboss/wildfly/modules/com/mysql/main
#RUN mkdir -p /opt/jboss/wildfly/modules/com/mariadb/main

#COPY payload/startup.sh /opt/jboss/wildfly/bin/
#COPY payload/mysql/module.xml /opt/jboss/wildfly/modules/com/mysql/main/
#COPY payload/mysql/mysql-connector-java-5.1.44-bin.jar /opt/jboss/wildfly/modules/com/mysql/main/

#COPY payload/mariadb/module.xml /opt/jboss/wildfly/modules/com/mariadb/main/
#COPY payload/mariadb/mariadb-java-client-2.4.0.jar /opt/jboss/wildfly/modules/com/mariadb/main/

#COPY payload/mysql/* /opt/jboss/wildfly/modules/com/mysql/main/
#COPY payload/mariadb/* /opt/jboss/wildfly/modules/com/mariadb/main/


RUN chown -R :0 /camunda \
 && chmod -R g+rwx /camunda \
 && chmod -R o+rx /camunda \
 && chown -R :0 /usr/lib \
 && chmod -R g+rwx /usr/lib \
 && chmod -R o+rx /usr/lib

RUN apk update
RUN apk upgrade
RUN apk add nano \
 && apk add joe \
 && apk add rsync \
 && apk add wget \
 && apk add net-tools
RUN apk upgrade

#RUN yum-config-manager --save --setopt=base.skip_if_unavailable=true --disablerepo=extras \
# && yum -y install nano \
# && yum -y install epel-release \
# && yum -y install joe \
# && yum -y install man \
# && yum -y install telnet \
# && yum -y install rsync \
# && yum -y install ant \
# && yum -y install maven \
# && yum -y install wget \
# && yum -y install screen.x86_64 \
# && yum -y install libtool-ltdl-devel \
# && yum -y install which \
# && yum -y install net-tools \
# && yum -y install iproute \
# && yum -y upgrade
 
RUN echo alias ll='ls -l --color=auto' >> /etc/profile
#RUN touch /.bash_history \
# && cp /root/.bash* / \
# && chown -R :0 /.bash* \
# && chmod -R g+rw /.bash* \
# && chmod -R o+r /.bash* \
# && echo PS1=\"\\[\\w\\]\\nuser@\\h:\\\\$ \" >> \.bashrc \
# && echo cd /opt/jboss >> /.bashrc

#VOLUME /opt/jboss/wildfly/standalone/deployments
#VOLUME /opt/jboss/wildfly/standalone/data
#VOLUME /opt/jboss/wildfly/standalone/configuration
#VOLUME /opt/jboss/wildfly/standalone/log
