FROM node:lts-alpine

WORKDIR /app

COPY . .

RUN npm i -g pm2

CMD ["pm2-runtime", "start", "ecosystem.config.js"]
