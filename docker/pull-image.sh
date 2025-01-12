#!/bin/bash
images=(
  "alpine:latest"
  "ubuntu:focal"
  "docker.elastic.co/logstash/logstash:8.15.3"
  "docker.elastic.co/elasticsearch/elasticsearch:8.15.3"
  "docker.elastic.co/kibana/kibana:8.15.3"
  "davidban77/netautomator:workstation"
  "davidban77/alpine:latest"
  "nginx:latest"
  "telegraf:1.15"
  "continuumio/miniconda3:latest"
  "jasonish/suricata:latest"
)

for image in "${images[@]}"; do
  if ! docker image inspect "$image" > /dev/null 2>&1; then
    echo "Image $image not found. Pulling..."
    docker pull "$image"
  else
    echo "Image $image already exists."
  fi
done
