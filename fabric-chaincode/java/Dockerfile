FROM hyperledger/fabric-baseimage:x86_64-0.4.2

# ADD codepackage.tgz to /root/chaincode
# cp /root/chaincode/src/build/chaincode.jar /root
# cp /root/chaincode/src/build/libs/* /root/libs

RUN curl -sSL https://services.gradle.org/distributions/gradle-2.12-bin.zip > /tmp/gradle-2.12-bin.zip
RUN unzip -qo /tmp/gradle-2.12-bin.zip -d /opt && rm /tmp/gradle-2.12-bin.zip
RUN ln -s /opt/gradle-2.12/bin/gradle /usr/bin

RUN mkdir /root/chaincode \
 && mkdir /root/libs \
 && mkdir /root/.m2 \
 && chown -R :0 /root \
 && chmod -R g+rw /root

ENV MAVEN_VERSION=3.3.9
ENV USER_HOME_DIR="/root"

RUN mkdir -p /usr/share/maven /usr/share/maven/ref \
  && curl -fsSL http://www-us.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz \
    | tar -xzC /usr/share/maven --strip-components=1 \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"

RUN apt-get -y update \
 && apt-get -y upgrade \
 && apt-get -y install libltdl7 \
 && apt-get -y install rsync \
 && apt-get -y install nano \
 && apt-get -y install joe \
 && apt-get -y install less\
 && apt-get -y install telnet

RUN echo alias ll='ls -l --color=auto' >> /etc/profile
RUN touch /.bash_history \
 && cp /root/.bash* / \
 && chown -R :0 /.bash* \
 && chmod -R g+rw /.bash* \
 && chmod -R o+r /.bash* \
 && echo PS1=\"[\\\\h \\\\W]\\\\$ \" >> /.bashrc \
 && echo cd /chaincode >> /.bashrc

WORKDIR /root

LABEL org.hyperledger.fabric.version=1.1.0-preview \
      org.hyperledger.fabric.base.version=0.4.2

ADD payload/javashim.tar.bz2 /root
ADD payload/protos.tar.bz2 /root
ADD payload/settings.gradle /root

# Build java shim after copying proto files from fabric/proto
RUN /root/core/chaincode/shim/java/javabuild.sh

#RUN mkdir /tmp/root \
# && cp -r /root /tmp/ \
# && chown -R :0 /tmp/root \
# && chmod -R g+rw /tmp/root

VOLUME /chaincode
