FROM openjdk:8-jdk-alpine
VOLUME /tmp
ADD ${artifactId}-server.jar ${artifactId}-server.jar
RUN echo "Asia/Shanghai" > /etc/timezone
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/${artifactId}-server.jar"]
