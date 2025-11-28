#!/usr/bin/env bash

cd /home/bkrz/docker-compose-server

echo -e '\033[34m\n ############################  step1 => 删除服务，清理镜像，>加载镜像 ############################\033[0m'
sudo docker compose stop vuln-demo
sudo docker compose rm -f vuln-demo
sudo docker rmi vuln-demo-server
sudo docker load -i /home/bkrz/vuln-demo-server-image.tar

echo -e '\033[34m\n ############################  step2 => 启动服务 ############################\033[0m'
sudo docker compose up --build -d vuln-demo
sudo docker compose ps -a
