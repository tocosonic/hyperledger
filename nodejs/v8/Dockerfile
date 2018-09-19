FROM node:8.12

RUN mkdir -p /nodejs \
 && chown -R :0 /nodejs \
 && chmod -R g+rwx /nodejs


ENV HOME=/nodejs
WORKDIR $HOME

# see .dockerignore
#ADD . $HOME/

RUN npm config set proxy http://webproxy.comp.db.de:8080
RUN npm config set https-proxy http://webproxy.comp.db.de:8080

RUN npm install -g @angular/cli
RUN npm install -g @storybook/cli
RUN npm install
RUN npm run build
RUN npm run build-storybook

CMD [ "npm", "start" ]

EXPOSE 3000
EXPOSE 3001
EXPOSE 4200

VOLUME $HOME
