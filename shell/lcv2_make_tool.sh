echo "lcv2 环境搭建辅助脚本 google cloud Linux debian9"

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
sed -i "s#//# #g"  /etc/v2ray/config.json
sed -i "s#//include_out_config# #g"  /etc/v2ray/config.json
sed -i "s#//include_ban_ad# #g"  /etc/v2ray/config.json
sed -i "s#//include_rules# #g"  /etc/v2ray/config.json

