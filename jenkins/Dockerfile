FROM quay.io/openshift/origin-jenkins:4.7.0

USER root

RUN wget http://updates.jenkins-ci.org/download/war/2.222.4/jenkins.war
RUN mv -f jenkins.war /usr/lib/jenkins/
