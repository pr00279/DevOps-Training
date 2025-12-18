# syntax=docker/dockerfile:1

FROM node:lts-alpine
WORKDIR /src/azure-sa
COPY . .
RUN npm install
CMD ["node", "index.js"]
EXPOSE 3000