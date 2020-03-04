#!/bin/bash

echo "lcv2 V7 环境搭建辅助脚本 v3.0"
echo "环境： google cloud Linux debian9"

echo "1,构建lcv2子服务器运行环境"
echo "2,启动lcv2子服务器"
echo "3,构建主控服务器（包含阿帕奇）"
echo "4,启动主控服务器"
echo "5,开启google ssh"


read -p "输入选择序号 > " cmd


if [ $cmd == "1" ]
then
	echo "构建lcv2子服务器与运行环境"
	cd ~
	apt-get update
	apt-get upgrade

	bash <(curl -s -L https://git.io/my-v2ray)

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

	echo "构建lcv2子服务器与运行环境 完成"

elif [ $cmd == "2" ]
then
	cd ~
	screen -S lcv2c
	./Lcv2_child_server


elif [ $cmd == "3" ]
then
	cd ~
	apt-get update
	apt-get upgrade

	apt install apache2
	apt install git

	cd /var/www

	git clone https://github.com/lucycore/ap_server.git

	mv ./ap_server ./html

	cd ~
	cp /var/www/html/v2ray-api/Lcv2_main_server ./Lcv2_main_server

	chmod ./Lcv2_main_server
	echo "构建lcv2主服务器与运行环境 完成"

elif [ $cmd == "4" ]
then
	cd ~
	screen -S lcv2
	./Lcv2_main_server
	

elif [ $cmd == "5" ]
then
	sed -i "s/PermitRootLogin no/PermitRootLogin yes/g"  /etc/ssh/sshd_config
	sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/g"  /etc/ssh/sshd_config

	passwd root

	reboot
else
   echo "没有符合的条件"
fi