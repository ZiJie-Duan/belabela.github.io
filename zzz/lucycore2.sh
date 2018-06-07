#!/bin/bash

echo "V2ray 全自动部署脚本"

echo "继续安装！"

echo "正在写入bbr加速"

cat >> /etc/sysctl.conf << EOF
net.core.default_qdisc=fq
net.ipv4.tcp_congestion_control=bbr
EOF

sysctl -p

echo "命令生效！"
echo "已启用bbr加速"
echo "正在重启server"

reboot
