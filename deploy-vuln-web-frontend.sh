#!/bin/bash

PEM_PATH=`pwd`/hd_rsa
REMOTE_USER=bkrz
REMOTE_HOST=123.59.0.83
UPLOAD_PATH=/home/bkrz
DIST_FILE_NAME=dist.zip
REMOTE_SHELL=start-vuln-web-frontend.sh

echo -e '\033[34m\n ############################  step0 检查服务器证书位置: '${PEM_PATH}'\033[0m'
if [ ! -f ${PEM_PATH} ]; then
  echo -e '\033[31m 证书文件不存在 \033[0m'
  exit 1
fi

echo -e '\033[34m\n ############################  step1 => 清理远程文件' ############################\033[0m'
ssh -i ${PEM_PATH} -p 22333 ${REMOTE_USER}@${REMOTE_HOST} "sudo rm -rf ${DIST_FILE_NAME}"


echo -e '\033[34m\n ############################  step2 上传包文件，上传位置: '${UPLOAD_PATH}'  ############################\033[0m'
scp -i ${PEM_PATH} -P 22333 ./${DIST_FILE_NAME} ${REMOTE_USER}@${REMOTE_HOST}:${UPLOAD_PATH}

sleep 2

echo -e '\033[34m\n ############################  step3 => 执行远程脚本 '${REMOTE_SHELL}' ############################\033[0m'
ssh -i ${PEM_PATH} -p 22333 ${REMOTE_USER}@${REMOTE_HOST} "sh ${REMOTE_SHELL}"

echo -e "\033[33m\n  ############################ 部署完成 ^V^ ############################\033[0m"