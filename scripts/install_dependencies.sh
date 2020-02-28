#!/bin/bash
yum -y install epel-release
yum -y install python-pip python-devel gcc nginx
pip install virtualenv 
pip install gunicorn flask
