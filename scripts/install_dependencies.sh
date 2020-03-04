#!/bin/bash
yum -y install epel-release
yum -y install python-pip python-devel gcc nginx
pip install virtualenv 
pip install gunicorn flask

cp /home/ec2-user/projects/flaskdemo/config/flaskdemo.conf /etc/init/
cp /home/ec2-user/projects/flaskdemo/config/nginx.conf /etc/nginx/nginx.conf
