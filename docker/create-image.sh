#!/bin/bash

images=("ads-lab/alpine:latest" "ads-lab/nginx:latest" "ads-lab/workstation:latest" "ads-lab/elasticsearch" "ads-lab/logstash:latest" "ads-lab/kibana:latest")
dockerfiles=("alpine/Dockerfile" "nginx/Dockerfile" "workstation/Dockerfile" "elasticsearch/Dockerfile" "logstash/Dockerfile" "kibana/Dockerfile")

for i in ${!images[@]}; do
  image=${images[$i]}
  dockerfile=${dockerfiles[$i]}
  
  if ! docker image inspect $image > /dev/null 2>&1; then
    echo "Image $image not found. Building..."
    docker build -t $image -f $dockerfile .
  else
    echo "Image $image already exists."
  fi
done
