#!/usr/bin/env bash

cp /vagrant/hosts /etc/hosts
cp /vagrant/resolv.conf /etc/resolv.conf
yum install ntp -y
service ntpd start
service iptables stop
mkdir -p /root/.ssh; chmod 600 /root/.ssh; cp /home/vagrant/.ssh/authorized_keys /root/.ssh/

# Increasing swap space
sudo dd if=/dev/zero of=/swapfile bs=1024 count=3072k
sudo mkswap /swapfile
sudo swapon /swapfile
echo "/swapfile       none    swap    sw      0       0" >> /etc/fstab