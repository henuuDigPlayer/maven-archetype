#!/bin/sh

source ./conf.sh
source ./fun.sh

application_name=$1
profile=$2
service_name="${application_name}-server"

if [ -z $application_name ]
  then echo "application_name  is null" &&  exit 1
fi
if [ -z $profile ]
  then profile=dev
fi

host_port=$(getServerPort 30001 32767)

echo "application=${application_name}"

echo "container is stoping and removing"

containerId=$(docker ps -a | grep -E "${application_name}" | awk '{print $1}')

if [ ! -z $containerId ]
  then docker stop $containerId && docker rm $containerId
fi

name=${service_name}"_"${host_port}"_"${image_version}

echo "container is starting"


docker run --name=${name} --privileged=true -p ${host_port}:${host_port} \
       --env SERVER_PORT=${host_port} \
       --env SERVER_HOST_NAME=${server_host_name} \
       --env EUREKA_HOST_NAME=${eureka_host_name} \
       --env PROFILE=${profile} \
       --add-host ${pay_hostname}:${pay_hostip} \
       --add-host ${order_hostname}:${order_hostip} \
       -v /data/servers/logs/${service_name}/:/data/servers/logs/${service_name} \
       -t ${application_name}:${image_version}
