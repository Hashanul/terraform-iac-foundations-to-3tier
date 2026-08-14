#!/bin/bash
set -eux

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install -y nginx

systemctl enable nginx
systemctl start nginx

cat <<'HTML' > /var/www/html/index.html
<h1> I am Hashanul Banna. I am learning Terraform for DevOps. </h1>
HTML

systemctl status nginx --no-pager --full