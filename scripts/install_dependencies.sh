#!/bin/bash
yum -y install epel-release
yum -y install python3-pip python3-devel gcc nginx
pip3 install virtualenv 
pip3 install gunicorn flask
