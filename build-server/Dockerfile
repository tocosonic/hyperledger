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
 && yum -y install git \
 && yum -y install golang \
 && yum -y install python34 \
 && yum -y install wget \
 && yum -y upgrade
RUN wget https://bootstrap.pypa.io/get-pip.py \
 && python get-pip.py
RUN pip install --upgrade pip \
 && pip install behave nose docker-compose \
 && pip install -I flask==0.10.1 python-dateutil==2.2 pytz==2014.3 pyyaml==3.10 couchdb==1.0 flask-cors==2.0.1 requests==2.4.3 pyOpenSSL==16.2.0 pysha3==1.0b1 grpcio==1.0.4 \
 && pip install urllib3 ndg-httpsclient pyasn1 ecdsa python-slugify grpcio-tools jinja2 b3j0f.aop six

RUN echo alias ll='ls -l --color=auto' >> /etc/profile
VOLUME /projects
