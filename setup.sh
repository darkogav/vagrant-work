#!/usr/bin/env bash

echo "Setting up vagrant image"
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm >>/tmp/setup.log 2>&1
yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm >>/tmp/setup.log 2>&1
yum-config-manager --enable remi-php72 -y >>/tmp/setup.log 2>&1
yum update >>/tmp/setup.log 2>&1
pkgs=(httpd mariadb php php-gd php-xml php-mbstring vim tar wget yum-utils)
for p in ${pkgs[@]}; do yum install -y ${p}; done; 
yum upgrade -y >>/tmp/setup.log 2>&1
systemctl start httpd >>/tmp/setup.log 2>&1
systemctl start mariadb-server >>/tmp/setup.log 2>&1
systemctl enable httpd >>/tmp/setup.log 2>&1
systemctl enable mariadb-server >>/tmp/setup.log 2>&1
reboot >>/tmp/setup.log 2>&1