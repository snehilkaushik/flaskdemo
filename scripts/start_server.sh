#!/bin/bash
#gunicorn --bind 0.0.0.0:8000 wsgi
initctl reload-configuration
initctl start flaskdemo
nginx -t
service nginx restart
