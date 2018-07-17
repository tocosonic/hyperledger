FROM centos:latest
# Prepare PVC moint points
RUN mkdir /projects \
 && chown -R :0 /projects \
 && chmod -R g+rwx /projects \
 && chmod -R o+rx /projects
RUN yum-config-manager --save --setopt=base.skip_if_unavailable=true \
 && yum -y install nano \
 && yum -y install epel-release \
 && yum -y install joe \
 && yum -y install man \
 && yum -y install telnet \
 && yum -y install rsync \
 && yum -y install java-1.8.0-openjdk.x86_64 \
 && yum -y install java-1.8.0-openjdk-javadoc-zip.noarch \
 && yum -y install java-1.8.0-openjdk-src.x86_64 \
 && yum -y install ant \
 && yum -y install maven \
 && yum -y install bzip2 \
 && yum -y install p7zip \
 && yum -y install wget \
 && yum -y install libtool-ltdl-devel \
 && yum -y install screen.x86_64 \
 && yum -y install libtool-ltdl-devel \
 && yum -y install which \
 && yum -y install net-tools \
 && yum -y install iproute \
 && yum -y install cifs-utils.x86_64 \
 && yum -y install autofs.x86_64 \
 && yum -y install pmount.x86_64 \
 && yum -y install libmount.x86_64 \
 && yum -y upgrade
RUN yum -y install curl-devel expat-devel gettext-devel openssl-devel zlib-devel perl-ExtUtils-MakeMaker
RUN yum -y groupinstall "Development Tools"
RUN cd /tmp \
 && mkdir src \
 && cd src \
 && wget -O git.tar.gz https://www.kernel.org/pub/software/scm/git/git-2.18.0.tar.gz \
 && tar xzf git.tar.gz \
 && cd git-2.18.0 \
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
 && echo PS1=\"\\[\\w\\]\\nuser@\\h:\\\\$ \" >> \.bashrc \
 && echo cd /projects/ >> /.bashrc \
 && echo export no_proxy=$no_proxy,10.104.204.110 >> /.bashrc \
 && echo export NO_PROXY=$no_proxy,10.104.204.110 >> /.bashrc
RUN chown -R :0 /mnt \
 && chmod -R g+rwx /mnt \
 && chmod -R o+rx /mnt
VOLUME /projects
