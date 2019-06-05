FROM ubuntu:bionic

RUN apt-get -y update \
 && apt-get -y upgrade

RUN apt-get -y install apt-utils \
 && apt-get -y install libltdl7 \
 && apt-get -y install rsync \
 && apt-get -y install nano \
 && apt-get -y install joe \
 && apt-get -y install less\
 && apt-get -y install procps \
 && apt-get -y install telnet

RUN apt-get -y install ant \
 && apt-get -y install maven \
 && apt-get -y install bzip2 \
 && apt-get -y install p7zip

RUN apt-get -y install wget \
 && apt-get -y install libtool \
 && apt-get -y install iproute2 \
 && apt-get -y install net-tools \
 && apt-get -y install curl

RUN apt-get -y install expat \
 && apt-get -y install gettext \
 && apt-get -y install openssl \
 && apt-get -y install zlib1g \
 && apt-get -y install perl \
 && apt-get -y install git

RUN apt-get -y install openjdk-8-jdk

RUN apt-get -y install libreadline5

#install java11
RUN wget https://download.java.net/java/GA/jdk12.0.1/69cfe15208a647278a19ef0990eea691/12/GPL/openjdk-12.0.1_linux-x64_bin.tar.gz -O /tmp/jdk.tar.gz
#RUN wget https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_linux-x64_bin.tar.gz -O /tmp/jdk.tar.gz
RUN tar xzvf /tmp/jdk.tar.gz --directory /usr/lib/jvm
RUN rm -f /tmp/jdk.tar.gz

RUN for bin in /usr/lib/jvm/jdk-12.0.1/bin/*; do update-alternatives --install /usr/bin/$(basename $bin) $(basename $bin) $bin 100; done
RUN for bin in /usr/lib/jvm/jdk-12.0.1/bin/*; do update-alternatives --set $(basename $bin) $bin; done

RUN touch /.gitconfig \
 && chown -R :0 /.gitconfig \
 && chmod -R g+rw /.gitconfig \
 && chmod -R o+r /.gitconfig

RUN chown :0 /etc/passwd \
 && chmod g+rw /etc/passwd

RUN echo alias ll='ls -l --color=auto' >> /etc/profile

RUN touch /.bash_history
RUN cp /root/.bash* / \
 && chown -R :0 /.bash* \
 && chmod -R g+rw /.bash* \
 && chmod -R o+r /.bash* \
 && echo PS1=\"\\[\\w\\]\\nuser@\\h:\\\\$ \" >> \.bashrc \
 && echo cd / >> /.bashrc \
 && echo export no_proxy=$no_proxy,10.104.204.110 >> /.bashrc \
 && echo export NO_PROXY=$no_proxy,10.104.204.110 >> /.bashrc
