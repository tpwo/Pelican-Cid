FROM node:alpine

RUN apk add --no-cache git

RUN npm install -g sass

WORKDIR /src

COPY src/sass ./sass/sass

CMD ["sass", "--no-source-map", "--style=compressed", "sass:css"]
