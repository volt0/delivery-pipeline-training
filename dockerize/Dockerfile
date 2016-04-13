FROM node:5

RUN mkdir /app
ADD . /app/
WORKDIR /app
RUN  npm install

CMD env DATABASE_URL=postgres://postgres:mysecretpassword@$PG_PORT_5432_TCP_ADDR:$PG_PORT_5432_TCP_PORT/crudtest node /app/index.js