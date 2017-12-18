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
 && yum -y upgrade
VOLUME /projects
