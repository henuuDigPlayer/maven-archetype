FROM openjdk:8-jdk-alpine
VOLUME /tmp
ADD app.jar app.jar
ADD certs /certs
RUN echo "Asia/Shanghai" > /etc/timezone
RUN echo 61.174.255.140 pay.zjbdos.com >> /etc/hosts
ENTRYPOINT ["java","-Xmx512m","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
