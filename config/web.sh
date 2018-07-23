#!/bin/bash
sleep 10

apt -y update
apt -y install nginx
export HOSTNAME=${curl -s http://169.254.169.254/metadata/v1/hostname}
export PUBLIC_IPV4=${curl -s http://169.254.169.254/metadata/v1/interfaces/public/0/ipv4/address}
echo Hello from Droplet $HOSTNAME, with IP Address: $PUBLIC_IPV4 > /var/www/html/index.nginx-debian.html