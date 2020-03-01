#!/bin/bash
yum -y install epel-release
yum -y install python-pip python-devel gcc nginx
pip install virtualenv 
pip install gunicorn flask

chmod 711 /home/ec2-user

cp config/flaskdemo.conf /etc/init/
cp config/nginx.conf /etc/nginx/nginx.conf
