FROM boxfuse/flyway:5.1

RUN chown -R :0 /var \
 && chmod -R g+rwx /var \
 && chown -R :0 /usr \
 && chmod -R g+rwx /usr \
 && chown -R :0 /run \
 && chmod -R g+rwx /run \
 && chown -R :0 /flyway \
 && chmod -R g+rwx /flyway

RUN chown -R :0 /usr \
 && chmod -R g+rwx /usr

ENV HOME /flyway

RUN echo "deb http://de.archive.ubuntu.com/ubuntu bionic main universe" >> /etc/apt/sources.list \
 && apt-get -y --allow-unauthenticated update
 
RUN apt-get -y --allow-unauthenticated upgrade
RUN apt-get -y install --allow-unauthenticated rsync \
 && apt-get -y install --allow-unauthenticated nano \
 && apt-get -y install --allow-unauthenticated joe \
 && apt-get -y install --allow-unauthenticated less\
 && apt-get -y install --allow-unauthenticated tree \
 && apt-get -y install --allow-unauthenticated p7zip-full \
 && apt-get -y install --allow-unauthenticated telnet

COPY drivers/* /flyway/drivers/

VOLUME /flyway/sql
VOLUME /flyway/jars
