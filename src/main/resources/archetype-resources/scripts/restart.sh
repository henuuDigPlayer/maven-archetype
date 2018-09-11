
#!/bin/sh
java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar

application_name=website
service_name="${application_name}-server"
version=1.0
port=$1
echo ${dbport}
echo ${dbuser}
echo ${dbpwd}
echo ${dbip}
dbp=${dbport}
dbu=${dbuser}
dbw=${dbpwd}
dbi=${dbip}

if [ -z $port ]
  then port=23500
fi

if [ -z $dbp ] || [ -z $dbu ] || [ -z $dbw ] || [ -z $dbi ]

  then
     echo "dbport or dbuser or dbpwd or dbip  is null"
     exit 1
fi

# ps -ef | grep -E "${service_name}" | awk '{print $2}' | xargs kill


nohup java -jar \
-Djava.security.egd=file:/dev/./urandom \
-DIP=${dbi} \
-DDB_PORT=${dbp} \
-DUSER=${dbu} \
-DPASSWORD=${dbw} \
-DSERVER_PORT=${port} \
 website-server.jar >/dev/null 2>&1 &