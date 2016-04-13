# docker


```

alias d='sudo docker'

d info

d run --name=test-1 -i -t ubuntu /bin/bash
> hostname
> cat /etc/hosts
> ip a
> # rm -rf /
> ctrl-p ctrl-q

d ps 

d ps -a

d attach test-1

d stop test-1
d start test-1

# https://docs.docker.com/engine/reference/commandline/ps/

d rm test-1

d run --name=noisy -d ubuntu /bin/bash -c 'while true; do date; sleep 5; done'

d logs noisy

d top noisy

d inspect noisy

d inspect noisy -f '{{.NetworkSettings.IPAddress}}'

d stop noisy

d run --rm -i -t node:5 /bin/bash

d search node
d pull node
d images node
d images ubuntu

d images

d run --rm -v /var/run/docker.sock:/var/run/docker.sock nate/dockviz images -t


d build -t=myapp .
d images myapp
d run --rm myapp node /index.js
d history myapp

d run --name nginx -d nginx

d ps | grep nginx
d port nginx 80

curl 127.0.0.1:<port>

curl $(d inspect -f '{{.NetworkSettings.IPAddress}}' nginx)


d run --name pg -e POSTGRES_PASSWORD=mysecretpassword -d postgres
d run --rm --link pg:db -it ubuntu /bin/bash 

> cat /etc/hosts
> env | grep DB

d run --rm --link pg:postgres -it postgres  sh -c 'exec psql -h "$POSTGRES_PORT_5432_TCP_ADDR" -p "$POSTGRES_PORT_5432_TCP_PORT" -U postgres'

d run --rm  --volumes-from pg -it ubuntu /bin/bash

```
