#!/usr/bin/env bash

port=$1
active=$2

if [ -z $port ]
  then port=23500
fi

if [ -z $active ]
  then env=dev
fi

java -Dfile.encoding=UTF-8 -Djava.security.egd=file:/dev/./urandom -Dspring.profiles.active=dev -jar rest-api.jar
nohup java -jar \
-Djava.security.egd=file:/dev/./urandom \
-DMYSQL_URL=10.70.11.237 \
-DMYSQL_PORT=3306 \
-DMYSQL_USER=root \
-DMYSQL_PWD=Huawei\!123 \
-DREDIS_HOST=10.70.11.163 \
-DREDIS_PORT=10241 \
-DREDIS_PWD=Redis@123 \
member.jar &