#!/bin/sh
source ./init.sh
containerIds=$(docker ps -a|grep Exited|awk '{print $1}')
if [ -z $containerIds ]
  then echo "no container exit" && exit 1
fi
for(( i=0;i<${#containerIds[@]};i++)) do
docker start ${containerIds[i]};
done;
