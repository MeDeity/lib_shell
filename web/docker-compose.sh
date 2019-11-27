#!/bin/sh

basedir="$(cd `dirname $0`; pwd)"
echo basedir:$basedir
cd ${basedir}

# docker-compose要管理的环境
compose(){
	echo batch $1: activemq, fastdfs,redis ...
	
	
	cd activemq
	docker-compose $1
	cd ..

	cd mysql
	docker-compose $1
	cd ..

	cd redis
	docker-compose $1
	cd ..

	cd tomcat
	docker-compose $1
	cd ..
	
	cd fastdfs
	docker-compose $1
	cd ..
}

if [ "$1" = "" ]; then
    echo ERROR: parameter init\|start\|stop\|rm  missing.
    
elif [ "$1" = "init" ]; then
    echo "Initializing env ..."
    

	# 准备数据文件夹
	if [ ! -d "${HOME}/docker-data/fdfs" ] ; then
		# fastdfs数据文件夹
		echo "Creating fastdfs data dir ${HOME}/docker-data/fdfs ..."
		mkdir -p ${HOME}/docker-data/fdfs
	fi
    
	# 给sh文件添加执行权限
	echo Add execute permission to *.sh
	find . -name "*.sh" |xargs chmod u+x
	
	echo Initialize env Done...
    
elif [ "$1" = "start" ]; then
        
    # 更新fastfs的IP, 此处也可直接填写虚拟机IP
    # IP=`ifconfig enp0s8 | grep inet | awk '{print $2}'| awk -F: '{print $2}'`
    #sed -i "s|IP=.*$|IP=${IP}|g" fastdfs/docker-compose.yaml
    
    echo BATCH START ...
    compose "up -d"
	
elif [ "$1" = "stop" ]; then
	echo BATCH STOP ...
    compose "stop"
	
elif [ "$1" = "rm" -o "$1" = "del" -o "$1" = "delete" ]; then
	echo BATCH RM ...
    compose "rm"

fi

exit 0