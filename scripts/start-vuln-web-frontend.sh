#!/usr/bin/env bash

echo -e '\033[34m\n ############################  step1 => 进入目录/home/bkrz ############################\033[0m'
cd /home/bkrz

echo -e '\033[34m\n ############################  step1 => 解压文件dist.zip ############################\033[0m'
rm -rf dist
unzip dist.zip

echo -e '\033[34m\n ############################  step2 => 拷贝dist至nginx目录 ############################\033[0m'
sudo cp -R dist /home/bkrz/docker-compose-server/nginx/html

echo -e '\033[34m\n ############################  step2 => 替换nginx目录html ############################\033[0m'
cd /home/bkrz/docker-compose-server/nginx/html/
sudo rm -rf vuln-web
sudo mv dist vuln-web

echo -e '\033[34m\n ############################  step2 => 重启nginx服务 ############################\033[0m'
cd /home/bkrz/docker-compose-server
sudo docker compose down
sudo docker compose up -d
sudo docker compose ps -a


