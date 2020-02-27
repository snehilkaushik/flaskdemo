#!/bin/bash
yum -y install epel-release
yum -y install python-pip python-devel gcc nginx
pip -y install virtualenv 
pip -y install gunicorn flask