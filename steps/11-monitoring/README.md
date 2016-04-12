# Monitoring

intro about prometheus

* setup prometeus
* metrics from docker
* metrics from aws
* metrics from app
* dashboards & search by grafana


## Intro

## Examples

## First run app docker container
```
sudo docker run --name box-app --link box-elastic:box-elastic.docker -p 5000:5000  -p 9100:9100 -d devopsru/delivery-pipeline-training
```

## Login to app container and run
```
/node_exporter 
```

## Start prometheus and grafana

```
sudo docker run --name box-prometheus -p 9090:9090 --link box-app:box-app.docker -v [REPO DIR]/steps/11-monitoring/prometheus.yml:/etc/prometheus/prometheus.yml -d prom/prometheus


sudo docker run --name box-grafana --link box-prometheus:box-prometheus.docker -p 3000:3000 -d grafana/grafana
```

