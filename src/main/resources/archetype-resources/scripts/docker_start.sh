#!/bin/sh

source ./conf.sh
source ./fun.sh


profile=$1
image_version=$2

if [ -z $profile ]
  then profile=dev
fi

if [ -z $image_version ]
  then image_version=1.0-SNAPSHOT
fi


host_port=$(getServerPort 30001 32767)

echo "host_port=${host_port}"

name=${service_name}"_"${host_port}"_"${image_version}

echo "container ${name}  is starting"

docker run --name=${name} --privileged=true -p ${host_port}:${host_port} \
       --env VERSION=${image_version} \
       --env SERVER_PORT=${host_port} \
       --env SERVER_HOST_NAME=${server_host_name} \
       --env EUREKA_HOST_NAME=${eureka_host_name} \
       --env PROFILE=${profile} \
       --add-host ${pay_hostname}:${pay_hostip} \
       --add-host ${order_hostname}:${order_hostip} \
       -v /data/servers/logs/${service_name}/:/data/servers/logs/${service_name} \
       -t ${service_name}:${image_version}
