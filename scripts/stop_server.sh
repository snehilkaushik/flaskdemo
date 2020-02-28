#!/bin/bash
cp /home/ec2-user/config/nginx.conf /etc/nginx/

nginx -t
service start nginx 
service enable nginx
