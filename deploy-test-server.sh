#!/bin/bash

PEM_PATH=~/scripts/new_auto_tools.pem
REMOTE_USER=ubuntu
REMOTE_HOST=119.45.169.164
UPLOAD_PATH=/home/ubuntu
DOCKER_FILE_NAME=vuln-demo-server-image.tar
REMOTE_SHELL=start-vuln-demo-test.sh

echo -e '\033[34m\n ############################  step0 检查服务器证书位置: '${PEM_PATH}'\033[0m'
if [ ! -f ${PEM_PATH} ]; then
  echo -e '\033[31m 证书文件不存在 \033[0m'
  exit 1
fi

echo -e '\033[34m\n ############################  step2 上传包文件，上传位置: '${UPLOAD_PATH}'  ############################\033[0m'
scp -i ${PEM_PATH} ./${DOCKER_FILE_NAME} ${REMOTE_USER}@${REMOTE_HOST}:${UPLOAD_PATH}

sleep 2

echo -e '\033[34m\n ############################  step3 => 执行远程脚本 '${REMOTE_SHELL}' ############################\033[0m'
ssh -i ${PEM_PATH} ${REMOTE_USER}@${REMOTE_HOST} "sudo sh ${REMOTE_SHELL}"

echo -e "\033[33m\n  ############################ 部署完成 ^V^ ############################\033[0m"