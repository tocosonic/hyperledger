FROM centos:latest
# Prepare PVC moint points
RUN mkdir /projects \
 && chown -R :0 /projects \
 && chmod -R g+rwx /projects \
 && chmod -R o+rx /projects
RUN yum -y install nano \
 && yum -y install epel-release \
 && yum -y install joe \
 && yum -y install man \
 && yum -y install telnet \
 && yum -y install rsync \
 && yum -y install java-1.8.0-openjdk.x86_64 \
 && yum -y install java-1.8.0-openjdk-javadoc-zip.noarch \
 && yum -y install java-1.8.0-openjdk-src.x86_64 \
 && yum -y install gcc.x86_64 \
 && yum -y install ant \
 && yum -y install maven \
 && yum -y install golang \
 && yum -y install wget \
 && yum -y install screen.x86_64 \
 && yum -y install libtool-ltdl-devel \
 && yum -y install docker.x86_64 \
 && yum -y install which \
 && yum -y upgrade
RUN yum -y install python34
RUN yum -y install curl-devel expat-devel gettext-devel openssl-devel zlib-devel perl-ExtUtils-MakeMaker
RUN yum -y groupinstall "Development Tools"
RUN wget https://bootstrap.pypa.io/get-pip.py \
 && python get-pip.py --no-wheel
RUN pip install --upgrade pip
RUN pip install behave nose docker-compose
RUN pip install -I flask==0.12.2 python-dateutil==2.6.1 pytz==2017.3 pyyaml==3.12 couchdb==1.1 flask-cors==3.0.3 requests==2.18.4 pyOpenSSL==17.5.0 pysha3==1.0.2 grpcio==1.8.2
RUN pip install urllib3 ndg-httpsclient pyasn1 ecdsa python-slugify grpcio-tools jinja2 b3j0f.aop six
RUN rm /get-pip.py
RUN cd /tmp \
 && mkdir src \
 && cd src \
 && wget -O git.tar.gz https://www.kernel.org/pub/software/scm/git/git-2.15.1.tar.gz \
 && tar xzf git.tar.gz \
 && cd git-2.15.1 \
 && make prefix=/usr/local/git all \
 && make prefix=/usr/local/git install \
 && echo "export PATH=/usr/local/git/bin:$PATH" >> /etc/bashrc \
 && source /etc/bashrc
RUN touch /.gitconfig \
 && chown -R :0 /.gitconfig \
 && chmod -R g+rw /.gitconfig \
 && chmod -R o+r /.gitconfig
RUN yum -y remove git
RUN rm -rf /tmp/src
RUN echo alias ll='ls -l --color=auto' >> /etc/profile
RUN ln -s /usr/local/git/bin/git /usr/local/bin/git \
 && ln -s /usr/local/git/bin/git-shell /usr/local/bin/git-shell \
 && ln -s /usr/local/git/bin/gitk /usr/local/bin/gitk \
 && ln -s /usr/local/git/bin/git-receive-pack /usr/local/bin/git-receive-pack \
 && ln -s /usr/local/git/bin/git-upload-archive /usr/local/bin/git-upload-archive \
 && ln -s /usr/local/git/bin/git-upload-pack /usr/local/bin/git-upload-pack
RUN touch /.bash_history
RUN cp /root/.bash* / \
 && chown -R :0 /.bash* \
 && chmod -R g+rw /.bash* \
 && chmod -R o+r /.bash* \
 && echo PS1=\"[\\\\h \\\\W]\\\\$ \" >> /.bashrc
RUN chown -R :0 /var/run \
 && chmod -R g+rwx /var/run \
 && chmod -R o+rx /var/run
VOLUME /projects
