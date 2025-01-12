# Template for GNS3 Appliance

This file provides instructions on configuring and setting up a template before starting a project.

## Table of content

- [Template for GNS3 Appliance](#template-for-gns3-appliance)
  - [Table of content](#table-of-content)
  - [Introduction](#introduction)
  - [Router (IOS)](#router-ios)
    - [Cisco C3660](#cisco-c3660)
  - [Docker](#docker)
    - [Manager](#manager)
      - [Netautomator](#netautomator)
    - [ELK stack](#elk-stack)
      - [Elasticseach](#elasticseach)
      - [Logstash](#logstash)
      - [Kibana](#kibana)
    - [Client](#client)
      - [Alpine](#alpine)
    - [Server](#server)
  
## Introduction

Create template in GNS edit -> preference, ensure name of template correct, it will be used later in ansible collection.

## Router (IOS)

Router in this project use IOS image from Cisco which can be downloaded from [Cisco website](https://www.cisco.com) or download from [unofficial site](https://github.com/hegdepavankumar/Cisco-Images-for-GNS3-and-EVE-NG)

### Cisco C3660

Configuration include:

- Template name: cisco-c3660
- Category: router
- Image: c3660-a3jk9s-mz.124-15.T14.image
- Console type: telnet

## Docker

To use a Docker machine in GNS 3, ensure to build a Docker image, which can be found [here](/docker/README.md) for instructions on how to create one. After building the image, it will appear in the existing Docker image in GNS3.

### Manager

#### Netautomator

- Image: ads-lab-workstation:latest
- Template name: ads-lab-workstation
- Adapter: 4 (recommend)
- Console type: telnet

### ELK stack

The project utilizes the [ELK stack](https://www.elastic.co/elastic-stack) to effectively manage network traffic and logs.

#### Elasticseach

- Image: ads-lab-elasticsearch:latest or official elasticsearch image
- Template name: ads-lab-elasticsearch
- Adapter: 4 (recommend)
- Console type: telnet
- Environment:
  ```
  discovery.type-single-node
  cluster.routing.allocation.disk.threshold_enabled=false
  ```
- Image volumes (advantaged settings): /usr/share/elasticsearch
- Extra host based on file host in project

#### Logstash

- Image: ads-lab-logstash:latest
- Template name: ads-lab-logstash
- Adapter: 4 (recommend)
- Console type: telnet
- Environment:
  ```
    ELASTIC_HOSTS=http://elastic:9200
    config.reload.automatic=true
  ```
- Image volumes (advantaged settings): /usr/share/logstash
- Extra host based on file host in project

#### Kibana

- Image: ads-lab-kibana:latest or official kibana image
- Template name: ads-lab-kibana
- Adapter: 4 (recommend)
- Console type: http
- Environment:
  ```
    SERVER_NAME=kibana
    ELASTICSEARCH_HOSTS='http://elastic:9200'
  ```
- http port in container: 5601, note it will use chromium to open web
- Image volumes (advantaged settings): /usr/share/kibana
- Extra host based on file host in project

### Client

#### Alpine

- Image: ads-lab-alpine:latest
- Template name: ads-lab-alpine
- Adapter: 4 (recommend)
- Console type: telnet

### Server
