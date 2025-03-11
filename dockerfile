FROM alpine:3.20

WORKDIR /app
COPY . /app/

RUN adduser -D -u 1000 app
RUN apk add --no-cache nodejs npm
RUN  npm install && npm run build
EXPOSE 3000
USER app

CMD ["node", "build/"]