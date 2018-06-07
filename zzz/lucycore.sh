#!/bin/bash

echo "V2ray 全自动部署脚本"

echo "正在更新源"
apt-get update

echo "正在安装Xshell传输"
apt-get install lrzsz

while :; do echo
  echo '1. 手动选择安装V2ray'
  echo '2. 全自动安装V2ray'
  echo '注意：手机使用请选择自动安装'
  read -p "请选择安装模式: " chooseproxytype
  [ -z "$chooseproxytype" ] && chooseproxytype=1
  if [[ ! $chooseproxytype =~ ^[1-2]$ ]]; then
    echo '输入错误，请输入正确的数字！'
  else
    break
  fi
done

if [[ $chooseproxytype == 1 ]];then
  echo "正在获取V2ray安装脚本并安装"
  wget http://lucycore.github.io/zzz/v2ray.sh && bash v2ray.sh
else
  echo "正在获取V2ray安装脚本并安装"
  wget http://lucycore.github.io/zzz/Av2ray.sh && bash Av2ray.sh
fi


echo "选择下载"
sz /root/config.json


echo "正在升级内核！"
mkdir kernel-tmp && cd kernel-tmp
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.9.88/linux-headers-4.9.88-040988_4.9.88-040988.201803181131_all.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.9.88/linux-headers-4.9.88-040988-generic_4.9.88-040988.201803181131_amd64.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.9.88/linux-image-4.9.88-040988-generic_4.9.88-040988.201803181131_amd64.deb
dpkg -i *.deb

echo "准备重启服务器"

reboot
