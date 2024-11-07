# Adaptive network defense on network emulator

## Table of contents

## Introduction

## Get started

### Evironment

In this lab, the project is developed in Ubuntu 20.04 LTS, and use GN3 version 2.2.50 to create network emulator. Why we need network emulator:

### Setup GNS3

Start GNS3 with command `sudo gns3` before running this project because sometimes we test with normal start command `gns3`, ansible playbook won't work to interact gns3.

### Template


#### Elasticsearch

discovery.type-single-node
cluster.routing.allocation.disk.threshold_enabled=false

/usr/share/elasticsearch


#### Logstash

ELASTIC_HOSTS=http://elastic:9200
config.reload.automatic=true

/usr/share/logstash

#### Kibana

SERVER_NAME=kibana
ELASTICSEARCH_HOSTS='http://elastic:9200'
    