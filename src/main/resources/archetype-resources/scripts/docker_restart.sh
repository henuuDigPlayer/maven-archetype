#!/bin/sh
source ./config.sh
port=$1
active=$2

if [ -z $port ]
  then port=23500
fi

if [ -z $active ]
  then env=dev
fi

echo "container is starting"

docker run -p ${port}:${port} \
       --env SERVER_PORT=${port} \
       --env SPRING_PROFILES_ACTIVE=${env}
       -v /data/servers/logs/${service_name}/:/data/servers/logs/${service_name} \
       -t ${application_name}/${service_name}:${version}