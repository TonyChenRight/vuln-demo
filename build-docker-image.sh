#!/bin/bash

echo "======================= 打包JAR ====================="
mvn clean package -DskipTests
sleep 2
echo "======================= 构建镜像 ====================="
docker build --platform linux/amd64 -t vuln-demo-server ./
sleep 2
echo "======================= 保存离线镜像包 ====================="
docker save -o vuln-demo-server-image.tar vuln-demo-server
#sleep 2
#echo "======================= 清理服务 ====================="
#docker stop vulnerability-library-server-container
#docker rm -f vulnerability-library-server-container
#sleep 2
#echo "======================= 启动服务 ====================="
#docker run -d --platform=linux/amd64 --add-host host.docker.internal:host-gateway -p 8080:8080 -e PROFILE_ENV="docker1" -e JAVA_OPTS="-XX:+UseZGC -XX:+ZGenerational -XX:+PrintGCDetails -XX:+PrintGCDateStamps" -e TZ="Asia/Shanghai" -e LANG="en_US.UTF-8" -v `pwd`/logs:/app/logs --name vulnerability-library-server-container vulnerability-library-server:latest
#docker ps -a