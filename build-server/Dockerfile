FROM centos:7
# Prepare PVC moint points
RUN mkdir /projects \
 && mkdir /fabric-bin \
 && chown -R :0 /projects \
 && chmod -R g+rwx /projects \
 && chmod -R o+rx /projects \
 && chown -R :0 /fabric-bin \
 && chmod -R g+rwx /fabric-bin \
 && chmod -R o+rx /fabric-bin
RUN yum -y install epel-release
RUN yum -y install https://repo.ius.io/ius-release-el7.rpm
RUN yum-config-manager --save --setopt=base.skip_if_unavailable=true \
 && yum -y install nano \
 && yum -y install joe \
 && yum -y install man \
 && yum -y install telnet \
 && yum -y install tree \
 && yum -y install rsync \
 && yum -y install java-1.8.0-openjdk.x86_64 \
 && yum -y install java-1.8.0-openjdk-javadoc-zip.noarch \
 && yum -y install java-1.8.0-openjdk-src.x86_64 \
 && yum -y install gcc.x86_64 \
 && yum -y install ant \
 && yum -y install maven \
# && yum -y install golang
 && yum -y install bzip2 \
 && yum -y install p7zip \
 && yum -y install wget \
 && yum -y install libtool-ltdl-devel \
# && yum -y install screen.x86_64 
 && yum -y install libtool-ltdl-devel \
 && yum -y install docker.x86_64 \
 && yum -y install which \
 && yum -y install net-tools \
 && yum -y install iproute
RUN yum -y upgrade
RUN yum -y install python34
RUN yum -y install curl-devel expat-devel gettext-devel openssl-devel zlib-devel perl-ExtUtils-MakeMaker
RUN yum -y groupinstall "Development Tools"
RUN yum -y install git2u
#RUN wget https://bootstrap.pypa.io/get-pip.py 
# && python get-pip.py --no-wheel
#RUN pip install --upgrade pip
#RUN pip install behave nose docker-compose
#RUN pip install -I flask==0.12.2 python-dateutil==2.6.1 pytz==2017.3 pyyaml==3.12 couchdb==1.1 flask-cors==3.0.3 requests==2.18.4 pyOpenSSL==17.5.0 pysha3==1.0.2 grpcio==1.8.2
#RUN pip install urllib3 ndg-httpsclient pyasn1 ecdsa python-slugify grpcio-tools jinja2 b3j0f.aop six
#RUN rm /get-pip.py
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
VOLUME /projects
