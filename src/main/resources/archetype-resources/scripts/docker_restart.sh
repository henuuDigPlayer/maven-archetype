#!/bin/sh
source ./config.sh
port=$1

if [ -z $port ]
  then port=23500
fi

docker images | grep -E "${service_name}" | awk '{print $3}'

echo "container is stoping and removing"

docker ps -a | grep -E "${service_name}" | awk '{print $1}' | xargs docker stop
docker ps -a | grep -E "${service_name}" | awk '{print $1}' | xargs docker rm

echo "container was removed and is starting"

docker run -p ${port}:${port} \
       --env SERVER_PORT=${port} \
       -v /data/servers/logs/${service_name}/:/data/servers/logs/${service_name} \
       -t ${application_name}/${service_name}:${version}

