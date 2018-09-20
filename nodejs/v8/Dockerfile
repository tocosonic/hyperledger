FROM node:8.12

RUN mkdir -p /nodejs \
 && chown -R :0 /nodejs \
 && chmod -R g+rwx /nodejs \
 && chown -R :0 /usr/ \
 && chmod -R g+rwx /usr/

ENV HOME=/nodejs
WORKDIR $HOME

COPY payload/build-and-start.js /

RUN chown :0 /build-and-start.js \
 && chmod g+rwx /build-and-start.js

RUN npm config set proxy http://webproxy.comp.db.de:8080
RUN npm config set https-proxy http://webproxy.comp.db.de:8080

#RUN npm install -g @angular/cli
#RUN npm install -g @storybook/cli
#RUN npm install
#RUN npm run build
#RUN npm run build-storybook

CMD [ "/build-and-start.js", "" ]

EXPOSE 3000
EXPOSE 3001
EXPOSE 4200

VOLUME $HOME
