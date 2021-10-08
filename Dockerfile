FROM node:alpine

WORKDIR /usr/app
COPY package.json ./
COPY index.js ./

RUN yarn install

RUN cat package.json

EXPOSE 3000 ##

CMD yarn start
