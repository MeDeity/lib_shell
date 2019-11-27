#! /bin/bash

function menu(){
    echo "===================="
    echo "环境搭建脚本"
    echo "1.docker 安装"
    echo "2.docker 重装"
    echo "3.批量安装容器"
    echo "4.批量停止容器"
    echo "5.批量移除容器"
    echo "create by MeDeity(langrenbule@gmail.com) 2019-11-22 15:38:46"
    echo "===================="
}

function handleInput(){
  source ./docker/docker_install.sh
  source ./docker-compose.sh
  case $1 in
    1)
      docker_install
      ;;
    2)
      docker_remove
      ;;
    3)
      compose up -d
      ;;
    4)
      compose stop
      ;;  
    5)
      compose rm
      ;;    
    *)
      exit 1
      ;;
  esac
}

menu
read index
handleInput $index

