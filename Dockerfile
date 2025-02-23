FROM node:18.20.7

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

COPY api/greetings.spec.yml /usr/src/app/api/greetings.spec.yml

RUN npm install swagger-ui-express

EXPOSE 3000

CMD [ "node", "server.js" ]