
sed -i "s/PermitRootLogin no/PermitRootLogin yes/g"  /etc/ssh/sshd_config
sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/g"  /etc/ssh/sshd_config

passwd root

reboot