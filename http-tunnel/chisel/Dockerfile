FROM ubuntu:18.04

RUN apt-get -y update
RUN apt-get -y upgrade

RUN apt-get -y install libltdl-dev \
 && apt-get -y install libltdl7 \
 && apt-get -y install rsync \
 && apt-get -y install nano \
 && apt-get -y install joe \
 && apt-get -y install less\
 && apt-get -y install wget \
 && apt-get -y install curl \
 && apt-get -y install procps \
 && apt-get -y install telnet

COPY payload/chisel /usr/local/bin/

RUN echo alias ll='ls -l --color=auto' >> /etc/profile

RUN touch /.bash_history \
 && cp /root/.bash* / \
 && chown -R :0 /.bash* \
 && chmod -R g+rw /.bash* \
 && chmod -R o+r /.bash* \
 && echo PS1=\"\\[\\w\\]\\nuser@\\h:\\\\$ \" >> \.bashrc
