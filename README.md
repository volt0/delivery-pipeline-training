# delivery-pipeline-training

[![Build Status](https://travis-ci.org/devops-ru/delivery-pipeline-training.svg?branch=master)](https://travis-ci.org/devops-ru/delivery-pipeline-training)


## Installation

```
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash

source ~/.nvm/nvm.sh

git clone https://github.com/devops-ru/delivery-pipeline-training.git myapp
git submodule init && git submodule update

cd myapp

nvm use 0.5

npm install

npm run test

npm run start
```


## Deploy

```
heroku login
heroku create
heroku addons:create heroku-postgresql:hobby-dev
git push heroku master
```


## Continuous Delivery

```
sudo gem install travis -v 1.8.2 --no-rdoc --no-ri
# travis setup heroku
travis encrypt $(heroku auth:token) --add deploy.api_key
```


### Full run

```
sudo docker run --name box-elastic -p 9200:9200 -d elasticsearch

sudo docker run --name=box-kibana -p 5601:5601 --link box-elastic:elasticsearch -d  kibana

sudo docker run --name box-app --link box-elastic:box-elastic.docker -p 5000:5000  -p 9100:9100 -d devopsru/delivery-pipeline-training

sudo docker run --name box-prometheus -p 9090:9090 --link box-app:box-app.docker -v [REPO DIR]/steps/11-monitoring/prometheus.yml:/etc/prometheus/prometheus.yml -d prom/prometheus

sudo docker run --name box-grafana --link box-prometheus:box-prometheus.docker -p 3000:3000 -d grafana/grafana
```
