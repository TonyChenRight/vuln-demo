#!/usr/bin/env bash

echo -e '\033[34m\n ############################  step1 => 删除服务，清理镜像，>加载镜像 ############################\033[0m'
sudo docker stop vulnerability-library-server-container
sudo docker rm -f vulnerability-library-server-container
sudo docker rmi vulnerability-library-server
sudo docker load -i vulnerability-library-server-image.tar

echo -e '\033[34m\n ############################  step2 => 启动服务 ############################\033[0m'
sudo docker run -d -p 8081:8081 -e PROFILE_ENV="test" -e JAVA_OPTS="-XX:+UseZGC -XX:+ZGenerational -XX:+PrintGCDetails -XX:+PrintGCDateStamps" -e TZ="Asia/Shanghai" -e LANG="en_US.UTF-8" -v `pwd`/vulnerability-library/logs:/app/logs -v `pwd`/vulnerability-library/config:/app/config --name vulnerability-library-server-container vulnerability-library-server:latest

sudo docker ps -a
