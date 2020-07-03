FROM quay.io/openshift/origin-jenkins:4.7.0

USER root

RUN yum-config-manager --disable rhel-fast-datapath
RUN yum-config-manager --disable rhel-server
RUN yum-config-manager --disable rhel-server-extras
RUN yum-config-manager --disable rhel-server-optional
RUN yum-config-manager --disable rhel-server-ose
RUN yum-config-manager --disable rhel-server-rhscl
RUN yum-config-manager --disable rhel-7-server-rpms

RUN yum -y --setopt=tsflags=nodocs --disableplugin=subscription-manager install jenkins-2.222.4

#RUN wget http://updates.jenkins-ci.org/download/war/2.222.4/jenkins.war
#RUN mv -f jenkins.war /usr/lib/jenkins/
