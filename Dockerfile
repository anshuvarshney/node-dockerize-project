FROM node:latest
WORKDIR /deploy 
ADD . .
RUN npm install
CMD ["node", "index.js"]
