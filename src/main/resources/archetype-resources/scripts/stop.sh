#!/bin/sh

source ./config.sh

docker ps -a | grep -E "${service_name}" | awk '{print $1}' | xargs docker stop
docker ps -a | grep -E "${service_name}" | awk '{print $1}' | xargs docker rm