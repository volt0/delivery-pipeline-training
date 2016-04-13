# Monitoring

intro about prometheus

* setup prometeus
* metrics from docker
* metrics from aws
* metrics from app
* dashboards & search by grafana

## Architecture

![Architecture](https://prometheus.io/assets/architecture.svg)


## Data model:  Metric names, labels and values

Every time series is uniquely identified by its metric name and a set of key-value pairs, also known as labels.

`` <metric name>{<label name>=<label value>, ...} ``

api_http_requests_total{method="POST", handler="/messages"}

## Metric types

* __Counter__ A counter is a cumulative metric that represents a single numerical value that only ever goes up. 
* __Gauge__ A gauge is a metric that represents a single numerical value that can arbitrarily go up and down.
* __Histogram__ A histogram samples observations (usually things like request durations or response sizes) and counts them in configurable buckets. 
* __Summary__ Similar to a histogram, a summary samples observations (usually things like request durations and response sizes).

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

# Free memory in GiB
node_memory_MemFree{instance='localhost:9100'} /1024/1024/1024

# Used memory in %
(node_memory_MemTotal{job='node',instance='localhost:9100'} - node_memory_MemFree{job='node',instance='localhost:9100'}) / node_memory_MemTotal{job='node',instance='localhost:9100'} * 100

# Return a whole range of time (5 minutes) 
node_memory_MemFree{instance='localhost:9100'} [5m]

# Time durations are specified as a number, followed immediately by one of the following units:
s - seconds
m - minutes
h - hours
d - days
w - weeks
y - years

# 5 minutes ago 
node_memory_MemFree{instance='localhost:9100'} offset 5m

# 5 minutes range had a week ago
node_memory_MemFree{instance='localhost:9100'}[5m] offset 1w

# Total memory by all instance in Gib
sum(node_memory_MemTotal)/1024/1024/1024

# Largest
topk(2, node_memory_MemTotal)/1024/1024/1024

```

## Config examples

Example prometheus config file

```
global:
  scrape_interval:  15s

scrape_configs:
  - job_name: 'node_exporter'
    target_groups:
      - targets: ['node-exporter:9100']

  - job_name: 'db'
    consul_sd_configs:
      - server:   '127.0.0.1:5361'
      - services: ['db']
```

Example alertmanager (old version)

```
notification_config {
  name: "slack"
  slack_config {
    webhook_url: "https://hooks.slack.com/services/[key]"
    channel: "#errors"
  }
}
aggregation_rule {
  # Optional filtering
  filter {
     name_re:  "instance"
     value_re: "ADDR:9002"
  }
  repeat_rate_seconds: 3600
  notification_config_name: "slack"
}
```

Rules

```
ALERT InstanceDown
  IF up == 0
  FOR 5m
  WITH {
    severity="page"
  }
  SUMMARY "Instance {{$labels.instance}} down"
  DESCRIPTION "@all  {{$labels.instance}} of job {{$labels.job}} has been down for more than 5 minutes."

```

## Start prometheus, node_exporter and grafana

#### Ports
* __9090__ Prometheus (additional http://host:9090/consoles/node.html)
* __3000__ Grafana
* __9100__ Node-Exporter

### Grafana

__Login:__    admin
__Password:__ admin


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
```

