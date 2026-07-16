FROM node:22-alpine

WORKDIR /app

COPY . .

RUN npm install

EXPOSE 8081

CMD ["node", "app.js"]