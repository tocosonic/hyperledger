FROM sonarqube:8.4.1-community

RUN apk update
RUN apk upgrade
RUN apk add joe \
 && apk add busybox \
 && apk add busybox-extras
RUN apk add curl

RUN touch /.bash_history \
 && chown -R :0 /.bash* \
 && chmod -R g+rw /.bash* \
 && chmod -R o+r /.bash* \
 && echo cd /opt/sonarqube >> /.bashrc

RUN chown -R :0 /opt/sonarqube \
 && chmod -R g+rw /opt/sonarqube 

VOLUME /opt/sonarqube/data
VOLUME /opt/sonarqube/extensions
VOLUME /opt/sonarqube/conf
