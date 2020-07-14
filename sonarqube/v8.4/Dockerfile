FROM sonarqube:8.4-community

RUN yum -y install epel-release
RUN yum -y install https://repo.ius.io/ius-release-el7.rpm
RUN yum-config-manager --save --setopt=base.skip_if_unavailable=true
RUN yum -y update
RUN yum -y upgrade
RUN yum -y install nano \
 && yum -y install joe \
 && yum -y install libtool-ltdl-devel \
 && yum -y install net-tools \
 && yum -y install telnet \
 && yum -y install wget
 
RUN echo alias ll='ls -l --color=auto' >> /etc/profile
RUN touch /.bash_history \
 && cp /root/.bash* / \
 && chown -R :0 /.bash* \
 && chmod -R g+rw /.bash* \
 && chmod -R o+r /.bash* \
 && echo PS1=\"\\[\\w\\]\\nuser@\\h:\\\\$ \" >> \.bashrc \
 && echo cd /opt/sonarqube >> /.bashrc

RUN chown -R :0 /opt/sonarqube \
 && chmod -R g+rw /opt/sonarqube 
 
VOLUME /opt/sonarqube/data
VOLUME /opt/sonarqube/extensions
