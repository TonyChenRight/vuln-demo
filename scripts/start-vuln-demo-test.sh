#!/usr/bin/env bash

echo -e '\033[34m\n ############################  step1 => 删除服务，清理镜像，>加载镜像 ############################\033[0m'
sudo docker stop vuln-demo-server-container
sudo docker rm -f vuln-demo-server-container
sudo docker rmi vuln-demo-server
sudo docker load -i vuln-demo-server-image.tar

echo -e '\033[34m\n ############################  step2 => 启动服务 ############################\033[0m'
sudo docker run -d -p 8082:8082 -e PROFILE_ENV="test" -e JAVA_OPTS="-XX:+UseZGC -XX:+ZGenerational -XX:+PrintGCDetails -XX:+PrintGCDateStamps" -e TZ="Asia/Shanghai" -e LANG="en_US.UTF-8" -v `pwd`/vuln-demo/logs:/app/logs -v `pwd`/vuln-demo/config:/app/config --name vuln-demo-server-container vuln-demo-server:latest

sudo docker ps -a
