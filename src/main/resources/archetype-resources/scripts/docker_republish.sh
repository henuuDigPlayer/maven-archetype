#!/bin/sh
source ./init.sh
application_name=$1
profile=$2
service_name="${application_name}-server"
server_host_name=61.174.254.22
eureka_host_name=183.131.202.13
pay_hostname=pay.zjbdos.com
pay_hostip=61.174.255.140
order_hostname=hdwhpharmt.zjbdos.com
order_hostip=61.174.254.204
if [ -z $application_name ]
  then echo "application_name  is null" &&  exit 1
fi
if [ -z $profile ]
  then profile=dev
fi

port=$(init_port ${application_name})

echo "application=${application_name}"
echo "port=${port}"
if [ $port -eq  8080 ]
  then
     echo "application_name  is error" &&  exit 1
fi
echo "container is stoping and removing"

containerId=$(docker ps -a | grep -E "[[:blank:]]${application_name}:" | awk '{print $1}')

if [ ! -z $containerId ]
  then docker stop $containerId && docker rm $containerId
fi


imageId=$(docker images | grep -E "^${application_name}[[:blank:]]" | awk '{print $3}')
if [ ! -z $imageId ]
  then docker rmi $imageId
fi


echo "image and container ware removed and image is building"
cd ..
#install common module first
cd commons
mvn clean install
cd ../services/client
mvn clean install
#mvn clean install
cd ../../services/${application_name}

mvn clean package -Dmaven.test.skip=true docker:build

echo "build success and container is starting"


docker run --privileged=true -p ${port}:${port} \
       --env SERVER_PORT=${port} \
       --env SERVER_HOST_NAME=${server_host_name} \
       --env EUREKA_HOST_NAME=${eureka_host_name} \
       --env PROFILE=${profile} \
       --add-host ${pay_hostname}:${pay_hostip} \
       --add-host ${order_hostname}:${order_hostip} \
       -v /data/servers/logs/${service_name}/:/data/servers/logs/${service_name} \
       -t ${application_name}:1.0-SNAPSHOT
