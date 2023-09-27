FROM node:18.18-alpine
WORKDIR /usr/src/lifusic
COPY *.* /usr/src/lifusic
RUN npm install --force
COPY . /usr/src/lifusic
RUN npm run build
ENTRYPOINT ["npm", "start"]