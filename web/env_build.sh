#! /bin/bash

function menu(){
    echo "===================="
    echo "环境搭建脚本"
    echo "1.docker 安装"
    echo "2.docker 卸载(卸载不完全)"
    echo "create by MeDeity(langrenbule@gmail.com) 2019-11-22 15:38:46"
    echo "===================="
}

function handleInput(){
  source ./docker/docker_install.sh
  case $1 in
    1)
      docker_install
      ;;
    2)
      docker_remove
      ;;
    *)
      exit 1
      ;;
  esac
}

menu
read index
handleInput $index

