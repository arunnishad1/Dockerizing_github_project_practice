# Build Stage
FROM node:22-alpine AS builder

WORKDIR /app

COPY package*.json ./

RUN npm ci

COPY . .

# Runtime Stage
FROM node:22-alpine

WORKDIR /app

COPY --from=builder /app .

RUN npm prune --omit=dev

EXPOSE 8081

CMD ["node", "app.js"]