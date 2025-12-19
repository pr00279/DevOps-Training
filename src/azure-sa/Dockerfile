# syntax=docker/dockerfile:1

FROM node:lts-alpine
WORKDIR /app
COPY . .
RUN npm install express multer dotenv @azure/storage-blob
CMD ["node", "index.js"]
EXPOSE 3000
CONTAINER_NAME filevault