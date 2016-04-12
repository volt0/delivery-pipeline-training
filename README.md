# delivery-pipeline-training

[![Build Status](https://travis-ci.org/devops-ru/delivery-pipeline-training.svg?branch=master)](https://travis-ci.org/devops-ru/delivery-pipeline-training)

## Slack
[devops-training-spb.slack.com](https://devops-training-spb.slack.com)

## Before start

### Need to be installed (for Mac OS)

* [Docker](https://docs.docker.com/engine/installation/mac/)
* [Kitematic](https://kitematic.com/)
* [Brew](http://brew.sh/)
* [Node js](https://nodejs.org/en/download/) or ``$ brew update && brew install nodejs``
* [PostgreSQl 9.4](http://www.postgresql.org/download/macosx/) or ``$ brew install postgresql``
* [Ansible](http://docs.ansible.com/ansible/intro_installation.html) or ``$ brew install ansible ``
* [Travis cli](https://github.com/travis-ci/travis.rb) or ``$ gem install travis``
* [Heroku cli](https://devcenter.heroku.com/articles/heroku-command) or ``$ gem uninstall heroku``

Prepare your database

``` bash
brew services start postgresql
createuser -s crudtest -P
# password: crudtest
createdb -U crudtest crudtest
```

### Pull docker images

__Run on docker console__

``` bash
docker pull prom/prometheus
docker pull tray/node_exporter
docker pull devopsru/delivery-pipeline-training
docker pull grafana/grafana
docker pull elasticsearch
docker pull kibana
```

### Create services accounts

[Heroku](https://signup.heroku.com/login)

[New Relic](https://newrelic.com/signup)


## Installation

``` bash
git clone https://github.com/devops-ru/delivery-pipeline-training.git myapp
cd myapp
git submodule init && git submodule update

npm install
npm run test
npm run start
```


### Full run


#### Ports

* __9090__ Prometheus
* __3000__ Grafana
* __9100__ Node-Exporter
* __5000__ CrudTest app
* __5601__ Kibana
* __9200__ ElasticSearch

If you use docker v1.10 and docker-compose v1.7, just run 

```bash
sudo docker-compose up 

# Deploy app to container, do not forget edit hosts file before
# $ ansible-playbook -i hosts bootstrap.yml
# log in to app container and run 
# $ cd /opt/crudtest/rieman
# $ lein run

# Grafana
# Login:    admin
# Password: admin
```

Or run each container

:TODO Add run node_exporter

``` bash
sudo docker run --name box-elastic -p 9200:9200 -d elasticsearch

sudo docker run --name=box-kibana -p 5601:5601 --link box-elastic:elasticsearch -d  kibana

sudo docker run --name box-app --link box-elastic:box-elastic.docker -p 5000:5000  -p 9100:9100 -d devopsru/delivery-pipeline-training
# Deploy app to container, do not forget edit hosts file before
# $ ansible-playbook -i hosts bootstrap.yml
# log in to app container and run 
# $ cd /opt/crudtest/rieman
# $ lein run

sudo docker run --name box-prometheus -p 9090:9090 --link node-exporter -v [REPO DIR]/steps/11-monitoring/prometheus.yml:/etc/prometheus/prometheus.yml -d prom/prometheus

sudo docker run --name box-grafana --link box-prometheus:box-prometheus.docker -p 3000:3000 -d grafana/grafana
# Grafana
# Login:    admin
# Password: admin
```

