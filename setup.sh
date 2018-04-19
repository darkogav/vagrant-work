#!/usr/bin/env bash

echo "Setting up vagrant image"
yum update >>/tmp/script.log 2>&1
yum upgrade -y >>/tmp/script.log 2>&1
pkgs=(httpd mariadb php php-gd php-xml php-mbstring vim tar wget)
for p in ${pkgs[@]}; do yum install -y ${p}; done; 
systemctl enable httpd -y >>/tmp/script.log 2>&1
systemctl enable mariadb-server -y >>/tmp/script.log 2>&1
reboot >>/tmp/script.log 2>&1