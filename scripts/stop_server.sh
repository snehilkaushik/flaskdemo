#!/bin/bash
cp /home/ec2-user/config/nginx.conf /etc/ngnix/
cp /home/ec2-user/config/flaskdemo.service /etc/systemd/system/

systemctl start flaskdemo 
systemctl enable flaskdemo
usermod -a -G ec2-user nginx 
chmod 710 /home/ec2-user 
nginx -t
systemctl start nginx 
systemctl enable nginx
