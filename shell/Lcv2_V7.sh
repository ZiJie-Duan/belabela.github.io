#!/bin/bash

echo "lcv2 V7 环境搭建辅助脚本 v3.0"
echo "环境： google cloud Linux debian9"

echo "1,构建lcv2子服务器运行环境"
echo "2,启动lcv2子服务器"
echo "3,开启google ssh"


read -p "输入选择序号 > " cmd


if [ $cmd == "1" ]
then
	echo "构建lcv2子服务器与运行环境"
	cd ~
	apt-get update
	apt-get upgrade

	bash <(curl -s -L https://git.io/v2ray.sh)
	v2ray stop

	rm /etc/v2ray/config.json
	rm /etc/v2ray/233blog_v2ray_backup.conf

	cd /etc/v2ray/

	wget http://ahhhhhh.top/v2ray-api/config.json
	wget http://ahhhhhh.top/v2ray-api/233blog_v2ray_backup.conf

	cd ~
	wget http://ahhhhhh.top/v2ray-api/v2rayapi

	wget http://ahhhhhh.top/v2ray-api/Lcv2_child_server

	chmod 777 ./Lcv2_child_server
	chmod 777 ./v2rayapi

	v2ray start

	echo "构建lcv2子服务器与运行环境 完成"

elif [ $cmd == "2" ]
then
	cd ~
	screen -S lcv2c


elif [ $cmd == "3" ]
then
	sed -i "s/PermitRootLogin no/PermitRootLogin yes/g"  /etc/ssh/sshd_config
	sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/g"  /etc/ssh/sshd_config

	passwd root

	reboot
else
   echo "没有符合的条件"
fi