#!/usr/bin/env bash

cp /vagrant/hosts /etc/hosts
cp /vagrant/resolv.conf /etc/resolv.conf
rm -rf /etc/zypp/repos.d/SUSE*
#zypper install iptables curl wget
cp /vagrant/opensuse.repo /etc/zypp/repos.d/
zypper  --non-interactive remove gcc43 cpp43 
zypper --non-interactive install --force-resolution  rrdtool
mkdir -p /root/.ssh; chmod 600 /root/.ssh; cp /home/vagrant/.ssh/authorized_keys /root/.ssh/

# Increasing swap space
sudo dd if=/dev/zero of=/swapfile bs=1024 count=3072k
sudo mkswap /swapfile
sudo swapon /swapfile
echo "/swapfile       none    swap    sw      0       0" >> /etc/fstab
