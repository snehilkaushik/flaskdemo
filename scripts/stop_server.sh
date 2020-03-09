#!/bin/bash
#gunicorn --bind 0.0.0.0:8000 wsgi
initctl stop flaskdemo
initctl reload-configuration
initctl start flaskdemo
nginx -t
fuser -k 80/tcp
service nginx restart
