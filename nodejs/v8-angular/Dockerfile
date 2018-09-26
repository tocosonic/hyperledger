FROM node:8.12

RUN mkdir -p /nodejs \
 && chown -R :0 /nodejs \
 && chmod -R g+rwx /nodejs \
 && chown -R :0 /usr/ \
 && chmod -R g+rwx /usr/

ENV HOME=/nodejs
WORKDIR $HOME

COPY payload/build-and-start.sh /

RUN chown :0 /build-and-start.sh \
 && chmod g+rwx /build-and-start.sh

RUN npm config set proxy http://webproxy.comp.db.de:8080
RUN npm config set https-proxy http://webproxy.comp.db.de:8080

CMD [ "/build-and-start.sh", "" ]

EXPOSE 3000
EXPOSE 3001
EXPOSE 4200

VOLUME $HOME
