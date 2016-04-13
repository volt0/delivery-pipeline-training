# Monitoring

intro about prometheus

* setup prometeus
* metrics from docker
* metrics from aws
* metrics from app
* dashboards & search by grafana


## Data model:  Metric names, labels and values

`` <metric name>{<label name>=<label value>, ...} ``

api_http_requests_total{method="POST", handler="/messages"}

## Query Examples

```
# Simple time series selection 
node_memory_MemFree

# Filtering by label value
node_memory_MemFree{instance='localhost:9100'}

# Some other filters
=: Select labels that are exactly equal to the provided string.
!=: Select labels that are not equal to the provided string.
=~: Select labels that regex-match the provided string (or substring).
!~: Select labels that do not regex-match the provided string (or substring).

# Time durations are specified as a number, followed immediately by one of the following units:
s - seconds
m - minutes
h - hours
d - days
w - weeks
y - years

# Free memory in GiB
node_memory_MemFree{instance='localhost:9100'} /1024/1024/1024

# Return a whole range of time (5 minutes) 
node_memory_MemFree{instance='localhost:9100'} [5m]

# 5 minutes ago 
node_memory_MemFree{instance='localhost:9100'} offset 5m

# 5 minutes range had a week ago
node_memory_MemFree{instance='localhost:9100'}[5m] offset 1w

# Total memory by all instance in Gib
sum(node_memory_MemTotal)/1024/1024/1024

# Largest
topk(2, node_memory_MemTotal)/1024/1024/1024

```


## Start prometheus, node_exporter and grafana

#### Ports
* __9090__ Prometheus
* __3000__ Grafana
* __9100__ Node-Exporter


Run with docker compose 

```
cd steps/11-monitoring
sudo docker-compose up
```

Or run throw docker run

```
sudo docker run --name node-exporter -p 9100:9100 tray/node_exporter
sudo docker run --name box-prometheus -p 9090:9090 --link node-exporter -v [REPO DIR]/steps/11-monitoring/prometheus.yml:/etc/prometheus/prometheus.yml -d prom/prometheus
sudo docker run --name box-grafana --link box-prometheus:box-prometheus.docker -p 3000:3000 -d grafana/grafana

# Grafana
# Login:    admin
# Password: admin
```

