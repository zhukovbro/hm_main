FROM node:current-alpine3.19@sha256:5207b5fe5a54c78aa9542ce0b83a940301eb12d2477eee0dd1faeb74c7c96b34

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]