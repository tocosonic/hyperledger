FROM centos:7
# Prepare PVC moint points
RUN mkdir -p /prometheus/data \
 && mkdir -p /prometheus/config \
 && mkdir -p /prometheus/app \
 && chown -R :0 /prometheus \
 && chmod -R g+rwx /prometheus \
 && chmod -R o+rx /prometheus
RUN yum -y install epel-release
RUN yum -y install https://repo.ius.io/ius-release-el7.rpm
RUN yum-config-manager --save --setopt=base.skip_if_unavailable=true
RUN yum -y install nano \
 && yum -y install joe \
 && yum -y install man \
 && yum -y install telnet \
 && yum -y install rsync \
 && yum -y install bzip2 \
 && yum -y install p7zip \
 && yum -y install wget \
 && yum -y install net-tools \
 && yum -y install iproute
RUN yum -y install git
RUN yum -y upgrade

RUN wget -q https://github.com/prometheus/prometheus/releases/download/v2.14.0/prometheus-2.14.0.linux-amd64.tar.gz -O /tmp/prometheus.tgz
RUN tar xzvf /tmp/prometheus.tgz -C /prometheus/app
RUN mv /prometheus/app/prometheus-*/* /prometheus/app/
RUN rm -f /tmp/prometheus-*

RUN source /etc/bashrc
RUN touch /.gitconfig \
 && chown -R :0 /.gitconfig \
 && chmod -R g+rw /.gitconfig \
 && chmod -R o+r /.gitconfig
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
RUN chown -R :0 /var/run \
 && chmod -R g+rwx /var/run \
 && chmod -R o+rx /var/run
RUN cd /prometheus
VOLUME /prometheus/data
VOLUME /prometheus/config
