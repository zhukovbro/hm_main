FROM node:18-alpine3.20@sha256:e37da457874383fa9217067867ec85fe8fe59f0bfa351ec9752a95438680056e

RUN apk add --no-cache python3 make g++

WORKDIR /app

COPY package*.json ./

RUN npm install pg

RUN npm install

COPY . .

RUN npm run build

# Откройте порт для Strapi
EXPOSE 1337

CMD ["npm", "run", "develop"]
