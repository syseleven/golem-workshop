FROM node:10

ENV NODE_ENV production

RUN mkdir /app

WORKDIR /app

COPY package*.json /app/

RUN npm install

COPY . /app/

EXPOSE 3000

ENTRYPOINT ["npm", "run", "debug"]
