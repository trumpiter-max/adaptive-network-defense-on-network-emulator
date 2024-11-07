#!/bin/bash

# List all Docker images with the string "ads-lab" in their name and remove them
docker image ls --format '{{.Repository}}:{{.Tag}}' | grep 'ads-lab' | while read -r image; do
  echo "Removing image: $image"
  docker image rm "$image" -f
done

echo "All images ads-lab have been removed."
