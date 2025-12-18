# syntax=docker/dockerfile:1

FROM node:lts-alpine
WORKDIR /app
COPY . .
RUN npm install
RUN sudo chown -R 502:20 "/.npm"
CMD ["node", "index.js"]
EXPOSE 3000

