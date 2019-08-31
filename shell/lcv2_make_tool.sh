#!/bin/bash

echo "lcv2 环境搭建辅助脚本"
echo "环境： google cloud Linux debian9"

echo "1,构建lcv2主体与运行环境"
echo "2,启动lcv2主服务器"
echo "3,启动lcv2服务器守护程序"
echo "4,加载ap_server下载库"
echo "5,转移主服务器数据库文件（上载）"
echo "6,转移主服务器数据库文件（下载）"
echo "7,开启google ssh"
echo ""


read -p "输入选择序号 > " cmd


if [ $cmd == "1" ]
then
	echo "构建lcv2主体与运行环境"
	cd ~
	apt-get update
	apt-get upgrade

	apt install lrzsz

	apt install git

	apt install apache2

	wget https://bootstrap.pypa.io/get-pip.py --no-check-certificate

	python3 get-pip.py

	git clone https://github.com/lucycore/lcv2.git

	pip3 install -r ./lcv2/mods.txt

	bash <(curl -s -L https://git.io/v2ray.sh)

	sed -i "s#//include_ss# #g"  /etc/v2ray/config.json
	sed -i "s#//include_socks# #g"  /etc/v2ray/config.json
	sed -i "s#//include_mtproto# #g"  /etc/v2ray/config.json
	sed -i "s#//include_in_config# #g"  /etc/v2ray/config.json
	sed -i "s#//include_out_config# #g"  /etc/v2ray/config.json
	sed -i "s#//include_ban_ad# #g"  /etc/v2ray/config.json
	sed -i "s#//include_rules# #g"  /etc/v2ray/config.json
	sed -i "s#//# #g"  /etc/v2ray/config.json

elif [ $cmd == "2" ]
then
	cd ~
	python3 ./lcv2/server/main.py

elif [ $cmd == "3" ]
then
	cd ~
	python3 ./lcv2/server/ptcore.py

elif [ $cmd == "4" ]
then
	cd /var/www/
	git clone https://github.com/lucycore/ap_server.git
	rm -r ./html
	mv ./ap_server ./html


elif [ $cmd == "5" ]
then
	cd ~
	mv ./test.db /var/www/html/test.db


elif [ $cmd == "6" ]
then
	cd ~
	wget http://www.lucycore.top/test.db

elif [ $cmd == "7" ]
then
	sed -i "s/PermitRootLogin no/PermitRootLogin yes/g"  /etc/ssh/sshd_config
	sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/g"  /etc/ssh/sshd_config

	passwd root

	reboot

else
   echo "没有符合的条件"
fi