FROM centos:7
# Prepare PVC moint points
RUN mkdir /projects \
 && chown -R :0 /projects \
 && chmod -R g+rwx /projects \
 && chmod -R o+rx /projects
RUN yum -y install epel-release
RUN yum -y install https://repo.ius.io/ius-release-el7.rpm
RUN yum-config-manager --save --setopt=base.skip_if_unavailable=true
RUN yum -y install nano \
 && yum -y install joe \
 && yum -y install man \
 && yum -y install telnet \
 && yum -y install tree \
 && yum -y install rsync \
 && yum -y install bzip2 \
 && yum -y install p7zip \
 && yum -y install wget \
 && yum -y install net-tools \
 && yum -y install iproute
RUN yum -y upgrade

RUN cd /projects && curl -s https://api.github.com/repos/prometheus/mysqld_exporter/releases/latest | grep browser_download_url | grep linux-amd64 | cut -d '"' -f 4 | wget -qi -
RUN cd /projects && tar xzvf *
RUN ls -l /projects
RUN cp /projects/mysqld*/mysqld* /projects/
RUN rm -rf /projects/mysqld_exporter-*

RUN source /etc/bashrc
RUN echo alias ll='ls -l --color=auto' >> /etc/profile
RUN touch /.bash_history
RUN cp /root/.bash* / \
 && chown -R :0 /.bash* \
 && chmod -R g+rw /.bash* \
 && chmod -R o+r /.bash* \
 && echo PS1=\"\\[\\w\\]\\nuser@\\h:\\\\$ \" >> \.bashrc \
 && echo cd /projects >> /.bashrc \
 && echo export no_proxy=$no_proxy,10.104.204.110 >> /.bashrc \
 && echo export NO_PROXY=$no_proxy,10.104.204.110 >> /.bashrc
