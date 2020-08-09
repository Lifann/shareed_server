#!/bin/bash

# update yum
yum install epel-release -y
yum update -y
yum upgrade -y
yum install wget -y
yum install vim -y
yum install curl -y

# install docker
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
wget https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.6-3.3.el7.x86_64.rpm
yum install -y https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.6-3.3.el7.x86_64.rpm
yum install docker-ce docker-ce-cli -y
sudo systemctl start docker

# upgrade bbr in kernel
cat /etc/redhat-release
# this will need confirmation cause reboot
wget --no-check-certificate https://github.com/teddysun/across/raw/master/bbr.sh && chmod +x bbr.sh && ./bbr.sh
uname -r
echo "net.core.default_qdisc = fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control = bbr" >> /etc/sysctl.conf
sysctl -p
sysctl net.ipv4.tcp_available_congestion_control
sysctl net.ipv4.tcp_congestion_control
lsmod | grep bbr

