#!/bin/bash
cp /home/ec2-user/config/nginx.conf /etc/nginx/
cp /home/ec2-user/config/flaskdemo.service /etc/systemd/system/

service start flaskdemo 
service enable flaskdemo
usermod -a -G ec2-user nginx 
chmod 710 /home/ec2-user 
nginx -t
service start nginx 
service enable nginx
