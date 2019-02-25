#!/bin/sh

export HOME=/nodejs
cd $HOME

npm install -g @angular/cli
#npm install -g @storybook/cli
npm install
npm run build
#npm run build-storybook

npm start
