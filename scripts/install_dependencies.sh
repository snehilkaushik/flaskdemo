#!/bin/bash
yum install epel-release 
yum -y install python3-pip python3-devel gcc nginx
pip3 -y install virtualenv 
pip3 -y install gunicorn flask
