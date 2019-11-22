#! /bin/bash

function docker_remove(){
    read -p "是否卸载重装(y/n)" -n 1  choice
    if [ $choice = "Y" -o $choice = "y" ]; then
        osReleas = ../../common/os_releas.sh 
        echo "当前系统为:$osReleas"
        case $osReleas in
            ubuntu)
                sudo apt-get remove docker docker-engine
                if [ $? -eq 0 ]; then
                    rm -fr /var/lib/docker/
                    if [ $? -eq 0 ]; then
                        echo "卸载完成,即将重新安装"
                        docker_install
                    else
                        echo "卸载docker失败,请手动卸载【2】"
                    fi
                else
                    echo "卸载docker失败,请手动卸载【1】"
                fi
                ;;
            centos)
                sudo yum remove docker \
                    docker-common \
                    container-selinux \
                    docker-selinux \
                    docker-engine
                if [ $? -eq 0 ]; then
                    rm -fr /var/lib/docker/
                    if [ $? -eq 0 ]; then
                        echo "卸载完成,即将重新安装"
                        docker_install
                    else
                        echo "卸载docker失败,请手动卸载【2】"
                    fi
                else
                    echo "卸载docker失败,请手动卸载【1】"
                fi
                ;;
            *)
                exit 1
                ;;
        esac
        
    else
        echo "docker已取消重装"
    fi
    
}

function docker_install(){
    echo "检测docker的安装情况中,请稍后..."
    docker -v
    if [ $? -eq 0 ]; then
        docker_remove
    else
        echo "安装docker环境中,请稍后..."
        curl -sSL https://get.daocloud.io/docker | sh
        echo "安装docker环境...安装完成!"
    fi
}

docker_install
